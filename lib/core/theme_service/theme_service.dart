import 'package:flutter/material.dart';
import 'package:flutter_app_empty_template/core/locator/locator.dart';
import 'package:flutter_app_empty_template/core/shared_preferences_service/shared_preferences_service.dart';
import 'package:flutter_app_empty_template/utils/theme/themes.dart';

/// Utility service which interacts with ThemeMode
///
/// Example of how to toggle the theme:
/// ```
/// final themeService = locator<ThemeService>();
/// themeService.toggleTheme();
/// ```
class ThemeService extends ChangeNotifier {
  ThemeService() {
    final themeModeString = locator<SharedPreferencesService>().themeMode;
    final themeMode = _parseThemeMode(themeModeString);
    _themeMode = themeMode;

    notifyListeners();
  }

  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  bool get isLightMode => _themeMode == ThemeMode.light;
  bool get isDarkMode => !isLightMode;

  ThemeData? get themeData =>
      isLightMode ? themes[CurrentTheme.light] : themes[CurrentTheme.dark];

  /// Toggles the current theme mode
  /// and saves the new theme mode to shared preferences
  /// using [SharedPreferencesService]
  /// and notifies all the listeners.
  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveThemeMode();
    notifyListeners();
  }

  void _saveThemeMode() =>
      locator<SharedPreferencesService>().themeMode = _themeMode.toString();

  ThemeMode _parseThemeMode(String themeModeString) {
    switch (themeModeString) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }
}
