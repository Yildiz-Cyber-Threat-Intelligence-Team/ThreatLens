import 'package:flutter/material.dart';
import '../../../../utils/score_updater.dart';
import '../../../../services/progress_service.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final List<Map<String, dynamic>> quizModules = [
    {
      'title': 'Siber Güvenlik Temelleri',
      'subtitle': 'Temel kavramlar ve prensipler',
      'icon': Icons.security,
      'color': const Color(0xFFBB86FC),
      'questions': [
        {
          "question": "Siber güvenlik nedir?",
          "options": [
            "Sadece şifre koruması",
            "Dijital varlıkların korunması",
            "Sadece antivirüs yazılımı",
            "Sadece firewall",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Hangi tehdit türü en yaygındır?",
          "options": ["Malware", "Phishing", "DDoS", "SQL Injection"],
          "correctIndex": 1,
        },
        {
          "question": "Güvenlik önlemlerinin temel amacı nedir?",
          "options": [
            "Sadece performans artışı",
            "Veri gizliliği ve bütünlüğü",
            "Sadece maliyet azaltma",
            "Sadece kullanıcı deneyimi",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Günlük güvenlik pratikleri nelerdir?",
          "options": [
            "Sadece şifre değiştirme",
            "Güçlü şifreler, güncellemeler, yedekleme",
            "Sadece antivirüs kullanma",
            "Sadece firewall açma",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Güvenlik testleri neden önemlidir?",
          "options": [
            "Sadece yasal zorunluluk",
            "Zayıflıkları tespit etmek için",
            "Sadece maliyet azaltma",
            "Sadece performans artışı",
          ],
          "correctIndex": 1,
        },
      ],
    },
    {
      'title': 'Ağ Güvenliği',
      'subtitle': 'Ağ altyapısı ve koruma',
      'icon': Icons.wifi,
      'color': const Color(0xFFBB86FC),
      'questions': [
        {
          "question":
              "Ağ protokollerinin güvenlik açısından en önemlisi hangisidir?",
          "options": ["HTTP", "HTTPS", "FTP", "SMTP"],
          "correctIndex": 1,
        },
        {
          "question": "Firewall'ın temel görevi nedir?",
          "options": [
            "Sadece performans artışı",
            "Ağ trafiğini filtrelemek",
            "Sadece şifreleme",
            "Sadece yedekleme",
          ],
          "correctIndex": 1,
        },
        {
          "question": "VPN teknolojisi ne sağlar?",
          "options": [
            "Sadece hız artışı",
            "Güvenli uzaktan erişim",
            "Sadece maliyet azaltma",
            "Sadece depolama",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Wireless güvenlik için en güvenli protokol hangisidir?",
          "options": ["WEP", "WPA", "WPA2/WPA3", "Açık ağ"],
          "correctIndex": 2,
        },
        {
          "question": "Ağ izleme neden önemlidir?",
          "options": [
            "Sadece performans takibi",
            "Anormal aktiviteleri tespit etmek",
            "Sadece maliyet kontrolü",
            "Sadece kullanıcı sayısı",
          ],
          "correctIndex": 1,
        },
      ],
    },
    {
      'title': 'Kriptografi',
      'subtitle': 'Şifreleme ve güvenlik',
      'icon': Icons.lock,
      'color': const Color(0xFFBB86FC),
      'questions': [
        {
          "question": "Kriptografinin temel amacı nedir?",
          "options": [
            "Sadece performans artışı",
            "Veri gizliliği ve güvenliği",
            "Sadece depolama tasarrufu",
            "Sadece hız artışı",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Simetrik şifreleme nedir?",
          "options": [
            "Aynı anahtar ile şifreleme/çözme",
            "Farklı anahtarlar kullanma",
            "Sadece hash fonksiyonu",
            "Sadece imza",
          ],
          "correctIndex": 0,
        },
        {
          "question": "Asimetrik şifreleme hangi anahtar çiftini kullanır?",
          "options": [
            "Sadece gizli anahtar",
            "Sadece açık anahtar",
            "Gizli ve açık anahtar çifti",
            "Sadece oturum anahtarı",
          ],
          "correctIndex": 2,
        },
        {
          "question": "Hash fonksiyonlarının özelliği nedir?",
          "options": [
            "Geri çözülebilir",
            "Tek yönlü ve geri çözülemez",
            "Sadece şifreleme",
            "Sadece sıkıştırma",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Dijital imza ne sağlar?",
          "options": [
            "Sadece gizlilik",
            "Kimlik doğrulama ve bütünlük",
            "Sadece şifreleme",
            "Sadece sıkıştırma",
          ],
          "correctIndex": 1,
        },
      ],
    },
    {
      'title': 'Penetrasyon Testi',
      'subtitle': 'Güvenlik testleri ve değerlendirme',
      'icon': Icons.bug_report,
      'color': const Color(0xFFBB86FC),
      'questions': [
        {
          "question": "Penetrasyon testi nedir?",
          "options": [
            "Sadece güvenlik taraması",
            "Sistemlerin güvenlik açıklarını test etme",
            "Sadece performans testi",
            "Sadece kullanılabilirlik testi",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Reconnaissance aşamasında ne yapılır?",
          "options": [
            "Sadece saldırı",
            "Hedef hakkında bilgi toplama",
            "Sadece raporlama",
            "Sadece temizlik",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Vulnerability assessment nedir?",
          "options": [
            "Sadece saldırı simülasyonu",
            "Zayıflıkları tespit etme ve değerlendirme",
            "Sadece raporlama",
            "Sadece temizlik",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Exploitation aşamasında ne yapılır?",
          "options": [
            "Sadece bilgi toplama",
            "Tespit edilen zayıflıkları kullanma",
            "Sadece raporlama",
            "Sadece temizlik",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Post-exploitation ne içerir?",
          "options": [
            "Sadece saldırı",
            "Veri toplama ve erişim sürdürme",
            "Sadece raporlama",
            "Sadece temizlik",
          ],
          "correctIndex": 1,
        },
      ],
    },
    {
      'title': 'CTI',
      'subtitle': 'Tehdit istihbaratı',
      'icon': Icons.visibility,
      'color': const Color(0xFFBB86FC),
      'questions': [
        {
          "question": "CTI (Cyber Threat Intelligence) nedir?",
          "options": [
            "Sadece antivirüs yazılımı",
            "Siber tehditler hakkında bilgi toplama ve analiz",
            "Sadece firewall",
            "Sadece şifreleme",
          ],
          "correctIndex": 1,
        },
        {
          "question": "OSINT ne anlama gelir?",
          "options": [
            "Sadece gizli kaynaklar",
            "Açık kaynak istihbaratı",
            "Sadece sosyal medya",
            "Sadece web siteleri",
          ],
          "correctIndex": 1,
        },
        {
          "question": "MITRE ATT&CK Framework ne için kullanılır?",
          "options": [
            "Sadece saldırı simülasyonu",
            "Saldırgan davranışlarını sınıflandırma",
            "Sadece güvenlik taraması",
            "Sadece raporlama",
          ],
          "correctIndex": 1,
        },
        {
          "question": "IoC (Indicator of Compromise) nedir?",
          "options": [
            "Sadece IP adresi",
            "Saldırı aktivitesini gösteren kanıtlar",
            "Sadece dosya hash'i",
            "Sadece domain adı",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Threat Hunting ne anlama gelir?",
          "options": [
            "Sadece pasif izleme",
            "Aktif olarak tehditleri arama",
            "Sadece raporlama",
            "Sadece analiz",
          ],
          "correctIndex": 1,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),

              ...quizModules.map((module) {
                final questionCount = module['questions'].length;
                final title = module['title'];
                final subtitle = module['subtitle'];
                final icon = module['icon'] as IconData;

                return _buildModuleCard(
                  title: title,
                  subtitle: subtitle,
                  icon: icon,
                  questionCount: questionCount,
                  module: module,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.quiz, color: Color(0xFFBB86FC), size: 24),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quiz Modülleri",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Bilgilerinizi test edin",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required int questionCount,
    required Map<String, dynamic> module,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => QuizDetailView(module: module),
          ),
        );
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFFBB86FC), size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Tooltip(
                    message: title,
                    preferBelow: false,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2541),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Tooltip(
                    message: subtitle,
                    preferBelow: false,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2541),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "$questionCount Soru",
                      style: const TextStyle(
                        color: Color(0xFFBB86FC),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFBB86FC),
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuizDetailView extends StatefulWidget {
  final Map<String, dynamic> module;

  const QuizDetailView({super.key, required this.module});

  @override
  State<QuizDetailView> createState() => _QuizDetailViewState();
}

class _QuizDetailViewState extends State<QuizDetailView> {
  int selectedIndex = -1;
  bool answerSubmitted = false;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool isModuleCompleted = false;
  Map<int, bool> questionAnswers = {};
  bool isLoading = true;
  int currentAttemptCount = 1;
  bool showRetryButton = false;

  bool _quizCompletedDialogShown = false;

  List<Map<String, dynamic>> get questions => widget.module['questions'];

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
  }

  Future<void> _initializeQuiz() async {
    await _checkModuleCompletion();
    await _loadQuestionAnswers();
    await _loadSelectedOption();
    await _loadAttemptCount();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _checkModuleCompletion() async {
    final moduleTitle = widget.module['title'];
    final completionStatus = await ProgressService.getModuleCompletionStatus(
      moduleTitle,
    );
    setState(() {
      isModuleCompleted = completionStatus >= 1.0;
    });
  }

  Future<void> _loadQuestionAnswers() async {
    final moduleTitle = widget.module['title'];
    final answers = await ProgressService.getModuleQuizAnswers(moduleTitle);
    if (mounted) {
      setState(() {
        questionAnswers = answers;
        correctAnswers = answers.values.where((isCorrect) => isCorrect).length;
      });
    }
  }

  Future<void> _loadSelectedOption() async {
    final moduleTitle = widget.module['title'];
    final selectedOption = await ProgressService.getQuizSelectedOption(
      moduleTitle: moduleTitle,
      questionIndex: currentQuestionIndex,
    );
    if (mounted && selectedOption != null) {
      setState(() {
        selectedIndex = selectedOption;
      });
    }
  }

  Future<void> _loadAttemptCount() async {
    final moduleTitle = widget.module['title'];
    final attemptCount = await ProgressService.getQuizAttemptCount(
      moduleTitle: moduleTitle,
      questionIndex: currentQuestionIndex,
    );
    if (mounted) {
      setState(() {
        currentAttemptCount = attemptCount;
        showRetryButton = attemptCount >= 2;
      });
    }
  }

  bool get isCurrentQuestionLocked {
    return questionAnswers.containsKey(currentQuestionIndex) || answerSubmitted;
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedIndex = -1;
        answerSubmitted = false;
      });
      _loadSelectedOption();
      _loadAttemptCount();
    } else {
      _showQuizCompleted();
    }
  }

  Future<void> _showQuizCompleted() async {
    if (_quizCompletedDialogShown) return;
    _quizCompletedDialogShown = true;

    final correctCount = questionAnswers.values
        .where((isCorrect) => isCorrect)
        .length;
    final score = (correctCount / questions.length * 100).round();

    if (questionAnswers.length >= questions.length) {
      await ProgressService.saveModuleProgress(
        moduleTitle: widget.module['title'],
        isCompleted: true,
      );
    }

    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1C2541),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            "🎉 Quiz Tamamlandı!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFBB86FC).withAlpha((0.2 * 255).toInt()),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      "Puanınız: $score%",
                      style: const TextStyle(
                        color: Color(0xFFBB86FC),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "$correctCount / ${questions.length} doğru",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "Quiz tamamlandı! Puanlar anlık olarak verildi.",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBB86FC),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Tamam",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    if (!mounted) return;
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFF0B132B),
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFFBB86FC)),
        ),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];
    final isLocked = isCurrentQuestionLocked;

    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),

              _buildProgressIndicator(),
              const SizedBox(height: 32),

              if (!answerSubmitted && isLocked) _buildLockedQuestionWarning(),
              if (!answerSubmitted && isLocked) const SizedBox(height: 16),

              _buildQuestionCard(currentQuestion["question"]),
              const SizedBox(height: 24),

              ...List.generate(currentQuestion["options"].length, (index) {
                return _buildOptionCard(
                  index: index,
                  option: currentQuestion["options"][index],
                  isSelected: selectedIndex == index,
                  isCorrect: index == currentQuestion["correctIndex"],
                  isWrong:
                      selectedIndex == index &&
                      index != currentQuestion["correctIndex"],
                  isAnswered: answerSubmitted || isLocked,
                  isLocked: isLocked,
                );
              }),

              const SizedBox(height: 32),

              _buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pushReplacementNamed('/home');
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFFBB86FC),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              widget.module['icon'] as IconData,
              color: const Color(0xFFBB86FC),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.module['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.module['subtitle'],
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final progress = (currentQuestionIndex + 1) / questions.length;
    final answeredCount = questionAnswers.length;
    final totalQuestions = questions.length;
    final correctCount = questionAnswers.values
        .where((isCorrect) => isCorrect)
        .length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Soru ${currentQuestionIndex + 1} / $totalQuestions",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "$correctCount doğru",
                    style: const TextStyle(
                      color: Color(0xFFBB86FC),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "$answeredCount / $totalQuestions",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: const Color(0xFF1C2541),
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFBB86FC), Color(0xFFBB86FC)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLockedQuestionWarning() {
    final isCorrectlyAnswered = questionAnswers[currentQuestionIndex] == true;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrectlyAnswered
            ? Colors.green.withValues(alpha: 0.1)
            : Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCorrectlyAnswered
              ? Colors.green.withValues(alpha: 0.3)
              : Colors.orange.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isCorrectlyAnswered ? Icons.check_circle : Icons.lock,
            color: isCorrectlyAnswered ? Colors.green : Colors.orange,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              isCorrectlyAnswered
                  ? "Bu soruyu doğru cevapladınız"
                  : "Bu soruyu zaten cevapladınız",
              style: TextStyle(
                color: isCorrectlyAnswered ? Colors.green : Colors.orange,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(String question) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFBB86FC).withValues(alpha: 0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
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
                "Soru",
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
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required int index,
    required String option,
    required bool isSelected,
    required bool isCorrect,
    required bool isWrong,
    required bool isAnswered,
    required bool isLocked,
  }) {
    Color backgroundColor = const Color(0xFF1C2541);
    Color borderColor = const Color(0xFFBB86FC).withValues(alpha: 0.1);
    IconData? icon;
    Color? iconColor;

    if (isAnswered || isLocked) {
      if (isCorrect) {
        backgroundColor = Colors.green.withValues(alpha: 0.2);
        borderColor = Colors.green;
        icon = Icons.check_circle;
        iconColor = Colors.green;
      } else if (isWrong) {
        backgroundColor = Colors.red.withValues(alpha: 0.2);
        borderColor = Colors.red;
        icon = Icons.cancel;
        iconColor = Colors.red;
      }
    } else if (isSelected) {
      backgroundColor = const Color(0xFFBB86FC).withValues(alpha: 0.2);
      borderColor = const Color(0xFFBB86FC);
    }

    return GestureDetector(
      onTap: (isAnswered || isLocked)
          ? null
          : () {
              setState(() {
                selectedIndex = index;
              });
            },
      child: Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: isSelected || isAnswered || isLocked
              ? const LinearGradient(
                  colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected || isAnswered || isLocked ? null : backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: isSelected || isAnswered || isLocked
                  ? const Color(0xFFBB86FC).withValues(alpha: 0.2)
                  : Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Icon(icon, color: iconColor, size: 20)),
              ),
            if (icon != null) const SizedBox(width: 16),
            Expanded(
              child: Text(
                option,
                style: TextStyle(
                  color: isSelected || isAnswered || isLocked
                      ? Colors.white
                      : Colors.white70,
                  fontSize: 16,
                  fontWeight: isSelected || isAnswered || isLocked
                      ? FontWeight.w600
                      : FontWeight.w400,
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
    );
  }

  Widget _buildActionButton() {
    final isLocked = isCurrentQuestionLocked;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLocked
                ? () => _nextQuestion()
                : (selectedIndex == -1
                      ? null
                      : () {
                          if (answerSubmitted) {
                            _nextQuestion();
                          } else {
                            _submitAnswer();
                          }
                        }),
            style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              elevation: WidgetStateProperty.all(4),
              shadowColor: WidgetStateProperty.all(
                Color.fromARGB((0.2 * 255).toInt(), 0, 0, 0),
              ),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
              overlayColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.pressed)) {
                  return Color.fromARGB((0.08 * 255).toInt(), 255, 255, 255);
                }
                return null;
              }),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFBB86FC), Color(0xFFBB86FC)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB((0.08 * 255).toInt(), 0, 0, 0),
                    blurRadius: 8.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Container(
                constraints: const BoxConstraints(minHeight: 48),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isLocked || answerSubmitted
                          ? Icons.arrow_forward
                          : Icons.send,
                      color: Colors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      isLocked
                          ? "Devam Et"
                          : (answerSubmitted ? "Devam Et" : "Cevabı Gönder"),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        if (showRetryButton && answerSubmitted && !isLocked) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = -1;
                  answerSubmitted = false;
                  showRetryButton = false;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFBB86FC), width: 1.5),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.refresh, color: Color(0xFFBB86FC), size: 20),
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
    );
  }

  Future<void> _submitAnswer() async {
    final isCorrect =
        selectedIndex == questions[currentQuestionIndex]["correctIndex"];

    final newAttemptCount = currentAttemptCount + 1;

    await ProgressService.saveQuizAnswer(
      moduleTitle: widget.module['title'],
      questionIndex: currentQuestionIndex,
      isCorrect: isCorrect,
      selectedOption: selectedIndex,
      attemptCount: newAttemptCount,
    );

    final wasPreviouslyCorrect = questionAnswers[currentQuestionIndex] == true;

    setState(() {
      answerSubmitted = true;
      currentAttemptCount = newAttemptCount;
      questionAnswers[currentQuestionIndex] = isCorrect;
      showRetryButton = newAttemptCount >= 2;
    });

    if (isCorrect && !wasPreviouslyCorrect) {
      await increaseUserScore(amount: 5);
    }
  }
}
