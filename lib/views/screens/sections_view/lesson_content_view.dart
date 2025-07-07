import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threat_lens/services/progress_service.dart';
import 'package:threat_lens/utils/score_updater.dart';

class LessonContentView extends StatefulWidget {
  final Map<String, dynamic> lesson;
  final VoidCallback? onCorrect;

  const LessonContentView({super.key, required this.lesson, this.onCorrect});

  @override
  State<LessonContentView> createState() => _LessonContentViewState();
}

class _LessonContentViewState extends State<LessonContentView> {
  final int _currentStep = 0;
  int? _selectedIndex;
  bool _answered = false;
  bool _showFeedback = false;
  bool _isCorrect = false;
  int _currentAttemptCount = 1;
  bool _showRetryButton = false;
  Map<int, bool> _questionAnswers = {};
  bool _isLoading = true;
  int _currentLessonIndex = 0;
  List<Map<String, dynamic>> _moduleLessons = [];

  @override
  void initState() {
    super.initState();
    _initializeLesson();
  }

  Future<void> _initializeLesson() async {
    await _loadQuestionAnswers();
    await _loadSelectedOption();
    await _loadAttemptCount();
    await _loadModuleLessons();

    final steps = widget.lesson['steps'] as List<dynamic>?;
    if (steps != null && steps.isNotEmpty) {
      final step = steps[_currentStep] as Map<String, dynamic>;
      final quizQuestion = step['quizQuestion'] as Map<String, dynamic>?;

      if (quizQuestion == null) {
        await _saveLessonProgressImmediately();
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadModuleLessons() async {
    final module = widget.lesson['module'] as Map<String, dynamic>?;
    if (module != null && module['lessons'] != null) {
      _moduleLessons = List<Map<String, dynamic>>.from(module['lessons']);

      final currentLessonTitle = widget.lesson['title'];
      _currentLessonIndex = _moduleLessons.indexWhere(
        (lesson) => lesson['title'] == currentLessonTitle,
      );
      if (_currentLessonIndex == -1) _currentLessonIndex = 0;
    }
  }

  Future<void> _loadQuestionAnswers() async {
    final lessonId = widget.lesson['id'] ?? widget.lesson['title'];
    final answers = await ProgressService.getLessonQuizAnswers(lessonId);
    setState(() {
      _questionAnswers = answers;
    });
  }

  Future<void> _loadSelectedOption() async {
    final lessonId = widget.lesson['id'] ?? widget.lesson['title'];
    final selectedOption = await ProgressService.getLessonQuizSelectedOption(
      lessonId: lessonId,
      questionIndex: _currentStep,
    );
    if (mounted && selectedOption != null) {
      setState(() {
        _selectedIndex = selectedOption;
      });
    }
  }

  Future<void> _loadAttemptCount() async {
    final lessonId = widget.lesson['id'] ?? widget.lesson['title'];
    final attemptCount = await ProgressService.getLessonQuizAttemptCount(
      lessonId: lessonId,
      questionIndex: _currentStep,
    );
    if (mounted) {
      setState(() {
        _currentAttemptCount = attemptCount;
        _showRetryButton = attemptCount >= 2;
      });
    }
  }

  bool get _isCurrentQuestionLocked {
    return _questionAnswers.containsKey(_currentStep) || _answered;
  }

  Future<void> _goToNextLesson() async {
    final steps = widget.lesson['steps'] as List<dynamic>?;
    if (steps != null && steps.isNotEmpty) {
      final step = steps[_currentStep] as Map<String, dynamic>;
      final quizQuestion = step['quizQuestion'] as Map<String, dynamic>?;

      if (quizQuestion == null) {
        final lessonId = widget.lesson['id'] ?? widget.lesson['title'];

        // Quiz'i olmayan dersler için işlemleri paralel olarak yap
        await Future.wait([
          ProgressService.saveLessonQuizAnswer(
            lessonId: lessonId,
            questionIndex: _currentStep,
            isCorrect: true,
            selectedOption: -1,
            attemptCount: 1,
          ),
          increaseUserScore(amount: 10),
        ]);

        // Callback'i çağır
        if (widget.onCorrect != null) {
          widget.onCorrect!();
        }

        // Modül kontrollerini arka planda yap
        Future.wait([
          _checkAndUpdateLessonCompletion(lessonId),
          _checkModuleCompletion(),
        ]);
      }
    }

    if (_currentLessonIndex < _moduleLessons.length - 1) {
      final nextLesson = _moduleLessons[_currentLessonIndex + 1];
      final lessonWithModule = {
        ...nextLesson,
        'module': widget.lesson['module'],
      };
      if (mounted) {
        context.pushReplacement('/lesson-content', extra: lessonWithModule);
      }
    } else {
      if (mounted) {
        context.go('/');
      }
    }
  }

  String get _buttonText {
    if (_moduleLessons.isEmpty) return 'Ana Sayfaya Dön';
    if (_currentLessonIndex < _moduleLessons.length - 1) {
      return 'Sıradaki Derse Geç';
    } else {
      return 'Modülü Tamamla';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: const Color(0xFF0B132B),
        body: const Center(
          child: CircularProgressIndicator(color: Color(0xFFBB86FC)),
        ),
      );
    }

    final steps = widget.lesson['steps'] as List<dynamic>?;
    if (steps == null || steps.isEmpty) {
      return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: const Color(0xFF0B132B),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: const Text(
              'İçerik henüz eklenmedi.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ),
      );
    }

    final step = steps[_currentStep] as Map<String, dynamic>;
    final content = step['content'] as List<dynamic>? ?? [];
    final quizQuestion = step['quizQuestion'] as Map<String, dynamic>?;
    final classicQuestion = step['classicQuestion'] as String?;

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: const Color(0xFF0B132B),
      resizeToAvoidBottomInset: true,
      extendBody: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...content.map((e) {
                      if (e['type'] == 'title') {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            e['text'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      } else if (e['type'] == 'desc') {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            e['text'],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        );
                      } else if (e['type'] == 'bullet') {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFBB86FC),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  e['text'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox();
                    }),
                  ],
                ),
              ),

              if (quizQuestion != null) ...[
                const SizedBox(height: 24),
                _buildQuizQuestion(quizQuestion),
              ] else if (classicQuestion != null) ...[
                const SizedBox(height: 24),
                _buildContinueButton(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        widget.lesson['title'] ?? 'Ders',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: const Color(0xFF1C2541),
      foregroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Future<void> _saveLessonProgressImmediately() async {
    if (!_isLoading) {
      final lessonId = widget.lesson['id'] ?? widget.lesson['title'];

      await ProgressService.saveLessonQuizAnswer(
        lessonId: lessonId,
        questionIndex: _currentStep,
        isCorrect: true,
        selectedOption: -1,
        attemptCount: 1,
      );

      await _checkAndUpdateLessonCompletion(lessonId);

      await increaseUserScore(amount: 10);
      if (widget.onCorrect != null) {
        widget.onCorrect!();
      }

      await _checkModuleCompletion();

      await _loadQuestionAnswers();

      if (mounted) {
        setState(() {
          _answered = true;
          _isCorrect = true;
        });
      }
    }
  }

  Future<void> _checkAndUpdateLessonCompletion(String lessonId) async {
    final quizAnswers = await ProgressService.getLessonQuizAnswers(lessonId);
    if (quizAnswers.isNotEmpty) {
      await ProgressService.saveLessonProgress(
        lessonId: lessonId,
        completedStep: 1,
        totalSteps: 1,
      );
      _checkModuleCompletion();
    }
  }

  Future<void> _checkModuleCompletion() async {
    final module = widget.lesson['module'] as Map<String, dynamic>?;
    if (module != null) {
      final moduleTitle = module['title'] as String?;
      if (moduleTitle != null) {
        final lessons = module['lessons'] as List<dynamic>?;
        if (lessons != null) {
          int completedLessons = 0;
          for (final lesson in lessons) {
            final lessonTitle = lesson['title'] as String?;
            if (lessonTitle != null) {
              final progress = await ProgressService.getLessonCompletionStatus(
                lessonTitle,
              );
              if (progress >= 1.0) {
                completedLessons++;
              }
            }
          }

          if (completedLessons == lessons.length) {
            await ProgressService.saveModuleProgress(
              moduleTitle: moduleTitle,
              isCompleted: true,
            );
          }
        }
      }
    }
  }

  Widget _buildQuizQuestion(Map<String, dynamic> quizQuestion) {
    final question = quizQuestion['question'] as String? ?? '';
    final options =
        (quizQuestion['options'] as List<dynamic>?)?.cast<String>() ?? [];
    final correctIndex = quizQuestion['correctIndex'] as int? ?? 0;
    final explanation = quizQuestion['explanation'] as String?;
    final isLocked = _isCurrentQuestionLocked;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.quiz,
                  color: Color(0xFFBB86FC),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Quiz Sorusu",
                style: TextStyle(
                  color: Color(0xFFBB86FC),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),

          ...options.asMap().entries.map((entry) {
            final i = entry.key;
            final option = entry.value;
            final selected = _selectedIndex == i;
            final correct =
                (isLocked && i == correctIndex) ||
                (_showFeedback && i == correctIndex);
            final wrong =
                (isLocked &&
                    _questionAnswers[_currentStep] == false &&
                    selected) ||
                (_showFeedback && selected && i != correctIndex);

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: (isLocked || _answered)
                    ? null
                    : () {
                        setState(() {
                          _selectedIndex = i;
                        });
                      },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: correct
                        ? Colors.green.withValues(alpha: 0.2)
                        : wrong
                        ? Colors.red.withValues(alpha: 0.2)
                        : selected
                        ? const Color(0xFFBB86FC).withValues(alpha: 0.2)
                        : Colors.white.withValues(alpha: 0.02),
                    border: Border.all(
                      color: correct
                          ? Colors.green.withValues(alpha: 0.3)
                          : wrong
                          ? Colors.red.withValues(alpha: 0.3)
                          : selected
                          ? const Color(0xFFBB86FC).withValues(alpha: 0.3)
                          : Colors.white24,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          correct
                              ? Icons.check_circle
                              : wrong
                              ? Icons.cancel
                              : selected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: correct
                              ? Colors.green
                              : wrong
                              ? Colors.red
                              : selected
                              ? const Color(0xFFBB86FC)
                              : Colors.white38,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          option,
                          style: TextStyle(
                            color: correct
                                ? Colors.green
                                : wrong
                                ? Colors.red
                                : Colors.white,
                            fontWeight: correct || wrong
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 15,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 16),

          if (!isLocked) ...[
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _answered || _selectedIndex == null
                        ? null
                        : () {
                            final isCorrect = _selectedIndex == correctIndex;
                            _submitAnswer(isCorrect);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBB86FC),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Cevabı Kontrol Et',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                if (_showRetryButton && _answered) ...[
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = null;
                          _answered = false;
                          _showFeedback = false;
                          _showRetryButton = false;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFFBB86FC),
                          width: 1.5,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.refresh,
                            color: Color(0xFFBB86FC),
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Tekrar Dene",
                            style: TextStyle(
                              color: Color(0xFFBB86FC),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],

          if (_showFeedback) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isCorrect
                    ? Colors.green.withValues(alpha: 0.2)
                    : Colors.red.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _isCorrect
                      ? Colors.green.withValues(alpha: 0.3)
                      : Colors.red.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _isCorrect ? Icons.check_circle : Icons.error,
                    color: _isCorrect ? Colors.green : Colors.red,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _isCorrect
                          ? 'Doğru cevap! +10 puan kazandınız! 🎉'
                          : 'Yanlış cevap!',
                      style: TextStyle(
                        color: _isCorrect ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (explanation != null && explanation.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                'Açıklama: $explanation',
                style: const TextStyle(
                  color: Color(0xFFBB86FC),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],

          if (_answered || _isCurrentQuestionLocked) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await _goToNextLesson();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isCorrect
                      ? Colors.green
                      : const Color(0xFFBB86FC),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  _buttonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Ders Tamamlandı",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Bu ders için quiz bulunmuyor. Ders tamamlandı! +10 puan kazandınız! 🎉",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await _goToNextLesson();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBB86FC),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
              child: Text(
                _buttonText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitAnswer(bool isCorrect) async {
    final lessonId = widget.lesson['id'] ?? widget.lesson['title'];

    final newAttemptCount = _currentAttemptCount + 1;

    await ProgressService.saveLessonQuizAnswer(
      lessonId: lessonId,
      questionIndex: _currentStep,
      isCorrect: isCorrect,
      selectedOption: _selectedIndex,
      attemptCount: newAttemptCount,
    );

    final wasPreviouslyCorrect = _questionAnswers[_currentStep] == true;

    setState(() {
      _showFeedback = true;
      _isCorrect = isCorrect;
      _answered = true;
      _currentAttemptCount = newAttemptCount;

      _questionAnswers[_currentStep] = isCorrect;

      _showRetryButton = newAttemptCount >= 2;
    });

    await _checkAndUpdateLessonCompletion(lessonId);

    if (isCorrect && !wasPreviouslyCorrect) {
      await increaseUserScore(amount: 10);
      if (widget.onCorrect != null) {
        widget.onCorrect!();
      }
    }

    _checkModuleCompletion();
  }
}
