import 'package:flutter/material.dart';

/// Enum that represents the available themes
enum CurrentTheme { light, dark }

/// Class whose purpose is to centralize, init and inject common themes.
final Map<CurrentTheme, ThemeData> themes = {
  CurrentTheme.light: _lightTheme,
  CurrentTheme.dark: _darkTheme,
};

/// Light theme
/// TODO: Add your custom light theme here
final ThemeData _lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
);

/// Dark theme
/// TODO: Add your custom dark theme here
final ThemeData _darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
);
