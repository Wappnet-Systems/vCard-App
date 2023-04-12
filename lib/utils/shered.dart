import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static const String isDarkThemeKey = 'is_dark_theme';

  static Future<bool> setIsDarkTheme(bool value) async {
    final SharedPreferences prefs = await getInstance();
    return prefs.setBool(isDarkThemeKey, value);
  }

  static Future<bool> getIsDarkTheme() async {
    final SharedPreferences prefs = await getInstance();
    return prefs.getBool(isDarkThemeKey) ?? false;
  }
}
