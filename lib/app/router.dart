import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:threat_lens/views/app_view.dart';
import 'package:threat_lens/views/screens/home_page_view/home_page_view.dart';
import 'package:threat_lens/views/screens/quiz_view/quiz_view.dart';
import 'package:threat_lens/views/screens/apt_dictionary_view/apt_dictionary_view.dart';
import 'package:threat_lens/views/screens/sections_view/lesson_detail_view.dart';
import 'package:threat_lens/views/screens/profile_view/profile_view.dart';
import 'package:threat_lens/views/screens/auth/login_screen.dart';
import 'package:threat_lens/views/screens/auth/register_screen.dart';
import 'package:threat_lens/views/screens/leaderboard_view/leaderboard_view.dart';
import 'package:threat_lens/views/screens/settings_view/settings_view.dart';
import 'package:threat_lens/views/screens/lessons/cyber_security_intro_lesson.dart';
import 'package:threat_lens/views/screens/home_page_view/egitim_modulleri_view.dart';
import 'package:threat_lens/views/screens/sections_view/lesson_content_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String register = '/register';

  static const String homepage = '/';
  static const String quiz = '/quiz';
  static const String aptdictionary = '/aptdictionary';
  static const String leaderboard = '/leaderboard';

  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String moduleDetail = '/module-detail';
  static const String cyberIntro = '/cybersecurity-intro';
  static const String moduleList = '/egitim-modulleri';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.login,

  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final loggingIn =
        state.fullPath == AppRoutes.login ||
        state.fullPath == AppRoutes.register;

    if (user == null && !loggingIn) return AppRoutes.login;
    if (user != null && loggingIn) return AppRoutes.homepage;
    return null;
  },

  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterScreen(),
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navShell) => AppView(navigationShell: navShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.homepage,
              builder: (context, state) => const HomePageView(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.quiz,
              builder: (context, state) => const QuizView(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.aptdictionary,
              builder: (context, state) => const AptDictionaryView(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.leaderboard,
              builder: (context, state) => const LeaderboardView(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.profile,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => const SettingsView(),
    ),

    GoRoute(
      path: AppRoutes.cyberIntro,
      builder: (context, state) => const CyberSecurityIntroLesson(),
    ),

    GoRoute(
      path: AppRoutes.moduleDetail,
      builder: (context, state) {
        final module = state.extra as Map<String, dynamic>;
        return LessonDetailView(module: module);
      },
    ),

    GoRoute(
      path: AppRoutes.moduleList,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return EgitimModulleriView(
          baslik: extra['baslik'] ?? 'Eğitim Modülleri',
          egitimler: List<String>.from(extra['egitimler'] ?? []),
        );
      },
    ),

    GoRoute(
      path: '/lesson-content',
      builder: (context, state) {
        final lesson = state.extra as Map<String, dynamic>;
        return LessonContentView(lesson: lesson);
      },
    ),
  ],
);
