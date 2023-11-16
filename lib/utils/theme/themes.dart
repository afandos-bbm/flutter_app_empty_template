import 'package:flutter/material.dart';

enum CurrentTheme { light, dark }

final Map<CurrentTheme, ThemeData> themes = {
  CurrentTheme.light: _lightTheme,
  CurrentTheme.dark: _darkTheme,
};

final ThemeData _lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
);

final ThemeData _darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
);
