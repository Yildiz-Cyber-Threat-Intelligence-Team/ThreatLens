import 'package:flutter/material.dart';
import 'package:threat_lens/services/settings_service.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final theme = await SettingsService.getTheme();
    _setThemeMode(theme);
  }

  void _setThemeMode(String theme) {
    switch (theme) {
      case 'light':
        _themeMode = ThemeMode.light;
        break;
      case 'dark':
        _themeMode = ThemeMode.dark;
        break;
      case 'auto':
        _themeMode = ThemeMode.system;
        break;
      default:
        _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  Future<void> setTheme(String theme) async {
    await SettingsService.setTheme(theme);
    _setThemeMode(theme);
  }

  bool get isDarkMode {
    return _themeMode == ThemeMode.dark;
  }

  bool get isLightMode {
    return _themeMode == ThemeMode.light;
  }

  bool get isSystemMode {
    return _themeMode == ThemeMode.system;
  }
}
