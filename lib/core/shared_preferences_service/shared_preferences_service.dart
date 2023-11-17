// ignore_for_file: unused_element

import 'package:shared_preferences/shared_preferences.dart';

/// Utility service which interacts with SharedPreferences
///
/// Example of how to storage a new boolean preference:
/// ```
/// static const String fooKey = 'fooKey';
///
/// set fooPreference(bool value) => _saveToSharedPreferences(fooKey, value);
/// bool get fooPreference => _getBoolValueFromSharedPreferences(fooKey);
/// ```
class SharedPreferencesService {
  static late SharedPreferencesService _instance;
  static late SharedPreferences _sharedPreferences;

  static const String themeModeKey = 'themeModeKey';
  static const String selectedLanguageKey = 'selectedLanguageKey';

  set themeMode(String value) => _saveToSharedPreferences(themeModeKey, value);
  String get themeMode => _getStringValueFromSharedPreferences(themeModeKey);

  set selectedLanguage(String value) =>
      _saveToSharedPreferences(selectedLanguageKey, value);
  String get selectedLanguage =>
      _getStringValueFromSharedPreferences(selectedLanguageKey);

  /// Saves a value to shared preferences based on the proved key.
  ///
  /// The [value] can be a [String], [bool], [int] or [double].
  void _saveToSharedPreferences<T>(String key, T value) {
    if (value is String) {
      _sharedPreferences.setString(key, value);
    }
    if (value is bool) {
      _sharedPreferences.setBool(key, value);
    }
    if (value is int) {
      _sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      _sharedPreferences.setDouble(key, value);
    }
  }

  String _getStringValueFromSharedPreferences(String key) =>
      _sharedPreferences.get(key) as String? ?? '';

  bool _getBoolValueFromSharedPreferences(String key) =>
      _sharedPreferences.get(key) as bool? ?? false;

  int _getIntValueFromSharedPreferences(String key) =>
      _sharedPreferences.get(key) as int? ?? 0;

  double _getDoubleValueFromSharedPreferences(String key) =>
      _sharedPreferences.get(key) as double? ?? 0.0;

  bool containsKey(String key) => _sharedPreferences.containsKey(key);

  /// Removes a preferences with the specified key.
  void removePreferenceWithKey(String key) {
    _sharedPreferences.remove(key);
  }

  /// Removes all shaved preferences.
  Future<void> removeAllSavedPreferences() async {
    await _sharedPreferences.clear();
  }

  /// Initializes the SharedPreferencesService and the
  /// underlying SharedPreferences.
  static Future<SharedPreferencesService> initSharedPreferencesService({
    SharedPreferences? sharedPreferences,
  }) async {
    _instance = SharedPreferencesService();
    _sharedPreferences =
        sharedPreferences ?? await SharedPreferences.getInstance();
    return _instance;
  }
}
