import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const String _languageKey = 'language';
  static const String _themeKey = 'theme';
  static const String _notificationsKey = 'notifications';
  static const String _soundKey = 'sound';

  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'tr';
  }

  static Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language);
  }

  static Future<String> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey) ?? 'dark';
  }

  static Future<void> setTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme);
  }

  static Future<bool> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_notificationsKey) ?? true;
  }

  static Future<void> setNotifications(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationsKey, enabled);
  }

  static Future<bool> getSound() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_soundKey) ?? true;
  }

  static Future<void> setSound(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_soundKey, enabled);
  }

  static Future<void> resetAllSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static List<Map<String, String>> getLanguageOptions() {
    return [
      {'code': 'tr', 'name': 'Türkçe', 'native': 'Türkçe'},
      {'code': 'en', 'name': 'English', 'native': 'English'},
    ];
  }

  static List<Map<String, String>> getThemeOptions() {
    return [
      {'code': 'dark', 'name': 'Karanlık', 'icon': '🌙'},
    ];
  }
}
