import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0B132B),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1C2541),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF0B132B),
      selectedItemColor: Color(0xFFBB86FC),
      unselectedItemColor: Colors.white70,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    cardTheme: CardThemeData(
      color: const Color(0xFF1C2541),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBB86FC),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFFBB86FC);
        }
        return Colors.white70;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFFBB86FC).withValues(alpha: 0.3);
        }
        return Colors.white24;
      }),
    ),
    useMaterial3: true,
  );

  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      foregroundColor: Color(0xFF1C2541),
      elevation: 2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: Color(0xFF7C3AED),
      unselectedItemColor: Color(0xFF666666),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF1C2541)),
      bodyMedium: TextStyle(color: Color(0xFF1C2541)),
      bodySmall: TextStyle(color: Color(0xFF666666)),
      titleLarge: TextStyle(color: Color(0xFF1C2541)),
      titleMedium: TextStyle(color: Color(0xFF1C2541)),
      titleSmall: TextStyle(color: Color(0xFF1C2541)),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF1C2541)),
    cardTheme: CardThemeData(
      color: const Color(0xFFFFFFFF),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7C3AED),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF7C3AED);
        }
        return Colors.grey;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF7C3AED).withValues(alpha: 0.3);
        }
        return Colors.grey.withValues(alpha: 0.3);
      }),
    ),
    useMaterial3: true,
  );

  static const List<Color> darkGradientColors = [
    Color(0xFF1C2541),
    Color(0xFF0B132B),
  ];

  static const List<Color> lightGradientColors = [
    Color(0xFFFFFFFF),
    Color(0xFFF0F0F0),
  ];

  static const Color darkPrimaryColor = Color(0xFFBB86FC);
  static const Color lightPrimaryColor = Color(0xFF7C3AED);

  static const Color darkBackgroundColor = Color(0xFF0B132B);
  static const Color lightBackgroundColor = Color(0xFFF5F5F5);

  static const Color darkCardColor = Color(0xFF1C2541);
  static const Color lightCardColor = Color(0xFFFFFFFF);
}
