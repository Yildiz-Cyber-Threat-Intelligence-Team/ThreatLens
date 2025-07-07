import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProgressService {
  static final _firestore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;

  static Future<void> saveLessonProgress({
    required String lessonId,
    required int completedStep,
    required int totalSteps,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final isCompleted = completedStep >= totalSteps;

    final lessonRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'completedSteps': completedStep,
      'isCompleted': isCompleted,
      'lastUpdated': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static Future<int> loadLessonProgress(String lessonId) async {
    final user = _auth.currentUser;
    if (user == null) return 0;

    final doc = await _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('lessons')
        .doc(lessonId)
        .get();

    if (doc.exists && doc.data()!.containsKey('completedSteps')) {
      final completedSteps = doc['completedSteps'] ?? 0;
      final isCompleted = doc['isCompleted'] ?? false;

      if (isCompleted) {
        return 1;
      }
      if (completedSteps > 0) {
        return 1;
      }
      return 0;
    }
    return 0;
  }

  static Future<double> getLessonCompletionStatus(String lessonId) async {
    final user = _auth.currentUser;
    if (user == null) return 0.0;

    final doc = await _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('lessons')
        .doc(lessonId)
        .get();

    if (doc.exists && doc.data()!.containsKey('completedSteps')) {
      final completedSteps = doc['completedSteps'] ?? 0;
      final isCompleted = doc['isCompleted'] ?? false;

      if (isCompleted || completedSteps > 0) {
        return 1.0;
      }
    }

    final quizAnswers = await getLessonQuizAnswers(lessonId);
    if (quizAnswers.isNotEmpty) {
      return 1.0;
    }

    return 0.0;
  }

  static Future<double> getModuleCompletionStatus(String moduleTitle) async {
    final user = _auth.currentUser;
    if (user == null) return 0.0;

    final doc = await _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('modules')
        .doc(moduleTitle)
        .get();

    if (doc.exists && doc.data()!.containsKey('isCompleted')) {
      final isCompleted = doc['isCompleted'] ?? false;
      return isCompleted ? 1.0 : 0.0;
    }
    return 0.0;
  }

  static Future<void> saveModuleProgress({
    required String moduleTitle,
    required bool isCompleted,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final moduleRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('modules')
        .doc(moduleTitle);

    await moduleRef.set({
      'isCompleted': isCompleted,
      'lastUpdated': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static Future<void> saveQuizAnswer({
    required String moduleTitle,
    required int questionIndex,
    required bool isCorrect,
    required int selectedOption,
    int attemptCount = 1,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('quiz_answers')
        .doc(moduleTitle);

    await quizRef.set({
      'questions': {
        questionIndex.toString(): {
          'isCorrect': isCorrect,
          'selectedOption': selectedOption,
          'attemptCount': attemptCount,
          'answeredAt': FieldValue.serverTimestamp(),
        },
      },
    }, SetOptions(merge: true));
  }

  static Future<bool> isQuizQuestionCorrectlyAnswered({
    required String moduleTitle,
    required int questionIndex,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return false;

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('quiz_answers')
        .doc(moduleTitle);

    final doc = await quizRef.get();
    if (doc.exists && doc.data()!.containsKey('questions')) {
      final questions = doc.data()!['questions'] as Map<String, dynamic>;
      final questionData = questions[questionIndex.toString()];
      if (questionData != null) {
        return questionData['isCorrect'] ?? false;
      }
    }
    return false;
  }

  static Future<Map<int, bool>> getModuleQuizAnswers(String moduleTitle) async {
    final user = _auth.currentUser;
    if (user == null) return {};

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('quiz_answers')
        .doc(moduleTitle);

    final doc = await quizRef.get();
    if (doc.exists && doc.data()!.containsKey('questions')) {
      final questions = doc.data()!['questions'] as Map<String, dynamic>;
      final answers = <int, bool>{};

      for (final entry in questions.entries) {
        final questionIndex = int.tryParse(entry.key);
        if (questionIndex != null) {
          answers[questionIndex] = entry.value['isCorrect'] ?? false;
        }
      }
      return answers;
    }
    return {};
  }

  static Future<void> saveLessonQuizAnswer({
    required String lessonId,
    required int questionIndex,
    required bool isCorrect,
    int? selectedOption,
    int attemptCount = 1,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('lesson_quiz_answers')
        .doc(lessonId);

    final data = {
      'isCorrect': isCorrect,
      'attemptCount': attemptCount,
      'answeredAt': FieldValue.serverTimestamp(),
    };

    if (selectedOption != null) {
      data['selectedOption'] = selectedOption;
    }

    await quizRef.set({
      'questions': {questionIndex.toString(): data},
    }, SetOptions(merge: true));
  }

  static Future<bool> isLessonQuizQuestionAnswered({
    required String lessonId,
    required int questionIndex,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return false;

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('lesson_quiz_answers')
        .doc(lessonId);

    final doc = await quizRef.get();
    if (doc.exists && doc.data()!.containsKey('questions')) {
      final questions = doc.data()!['questions'] as Map<String, dynamic>;
      return questions.containsKey(questionIndex.toString());
    }
    return false;
  }

  static Future<bool> isLessonQuizQuestionCorrectlyAnswered({
    required String lessonId,
    required int questionIndex,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return false;

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('lesson_quiz_answers')
        .doc(lessonId);

    final doc = await quizRef.get();
    if (doc.exists && doc.data()!.containsKey('questions')) {
      final questions = doc.data()!['questions'] as Map<String, dynamic>;
      final questionData = questions[questionIndex.toString()];
      if (questionData != null) {
        return questionData['isCorrect'] ?? false;
      }
    }
    return false;
  }

  static Future<Map<int, bool>> getLessonQuizAnswers(String lessonId) async {
    final user = _auth.currentUser;
    if (user == null) return {};

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('lesson_quiz_answers')
        .doc(lessonId);

    final doc = await quizRef.get();
    if (doc.exists && doc.data()!.containsKey('questions')) {
      final questions = doc.data()!['questions'] as Map<String, dynamic>;
      final answers = <int, bool>{};

      for (final entry in questions.entries) {
        final questionIndex = int.tryParse(entry.key);
        if (questionIndex != null) {
          answers[questionIndex] = entry.value['isCorrect'] ?? false;
        }
      }
      return answers;
    }
    return {};
  }

  static Future<void> resetAllProgress() async {
    final user = _auth.currentUser;
    if (user == null) {
      return;
    }

    try {
      final lessonsRef = _firestore
          .collection('progress')
          .doc(user.uid)
          .collection('lessons');

      final lessonsSnapshot = await lessonsRef.get();

      final batch = _firestore.batch();

      for (final doc in lessonsSnapshot.docs) {
        batch.delete(doc.reference);
      }

      final modulesRef = _firestore
          .collection('progress')
          .doc(user.uid)
          .collection('modules');

      final modulesSnapshot = await modulesRef.get();

      for (final doc in modulesSnapshot.docs) {
        batch.delete(doc.reference);
      }

      final quizAnswersRef = _firestore
          .collection('progress')
          .doc(user.uid)
          .collection('quiz_answers');

      final quizAnswersSnapshot = await quizAnswersRef.get();

      for (final doc in quizAnswersSnapshot.docs) {
        batch.delete(doc.reference);
      }

      final lessonQuizAnswersRef = _firestore
          .collection('progress')
          .doc(user.uid)
          .collection('lesson_quiz_answers');

      final lessonQuizAnswersSnapshot = await lessonQuizAnswersRef.get();

      for (final doc in lessonQuizAnswersSnapshot.docs) {
        batch.delete(doc.reference);
      }

      final profileRef = _firestore.collection('profile').doc(user.uid);
      batch.set(profileRef, {
        'modulesCompleted': 0,
        'totalScore': 0,
        'quizAttempts': 0,
        'lastReset': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      final quizRef = _firestore.collection('quiz_scores').doc(user.uid);

      batch.set(quizRef, {
        'scores': {},
        'totalScore': 0,
        'lastReset': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      final userRef = _firestore.collection('users').doc(user.uid);
      batch.update(userRef, {
        'score': 0,
        'lastReset': FieldValue.serverTimestamp(),
      });

      await batch.commit();
    } catch (e) {
      rethrow;
    }
  }

  static Future<int?> getQuizSelectedOption({
    required String moduleTitle,
    required int questionIndex,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return null;

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('quiz_answers')
        .doc(moduleTitle);

    final doc = await quizRef.get();
    if (doc.exists && doc.data()!.containsKey('questions')) {
      final questions = doc.data()!['questions'] as Map<String, dynamic>;
      final questionData = questions[questionIndex.toString()];
      if (questionData != null) {
        return questionData['selectedOption'] as int?;
      }
    }
    return null;
  }

  static Future<int?> getLessonQuizSelectedOption({
    required String lessonId,
    required int questionIndex,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return null;

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('lesson_quiz_answers')
        .doc(lessonId);

    final doc = await quizRef.get();
    if (doc.exists && doc.data()!.containsKey('questions')) {
      final questions = doc.data()!['questions'] as Map<String, dynamic>;
      final questionData = questions[questionIndex.toString()];
      if (questionData != null) {
        return questionData['selectedOption'] as int?;
      }
    }
    return null;
  }

  static Future<int> getQuizAttemptCount({
    required String moduleTitle,
    required int questionIndex,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return 0;

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('quiz_answers')
        .doc(moduleTitle);

    final doc = await quizRef.get();
    if (doc.exists && doc.data()!.containsKey('questions')) {
      final questions = doc.data()!['questions'] as Map<String, dynamic>;
      final questionData = questions[questionIndex.toString()];
      if (questionData != null) {
        return questionData['attemptCount'] as int? ?? 0;
      }
    }
    return 0;
  }

  static Future<int> getLessonQuizAttemptCount({
    required String lessonId,
    required int questionIndex,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return 0;

    final quizRef = _firestore
        .collection('progress')
        .doc(user.uid)
        .collection('lesson_quiz_answers')
        .doc(lessonId);

    final doc = await quizRef.get();
    if (doc.exists && doc.data()!.containsKey('questions')) {
      final questions = doc.data()!['questions'] as Map<String, dynamic>;
      final questionData = questions[questionIndex.toString()];
      if (questionData != null) {
        return questionData['attemptCount'] as int? ?? 0;
      }
    }
    return 0;
  }
}
