import 'package:planet_defender/presentations/themes/base_color.dart';
import 'package:planet_defender/presentations/themes/base_theme.dart';
import 'package:planet_defender/presentations/themes/text_style.dart';
import 'package:flutter/material.dart';

class AppTheme implements BaseTheme {
  static BaseThemeColor getColors(BuildContext context) {
    return BaseThemeColor.of(context);
  }

  @override
  ThemeData darkTheme(context) {
    return ThemeData(textTheme: getTextTheme(context));
  }

  @override
  ThemeData lightTheme(context) {
    return ThemeData(textTheme: getTextTheme(context));
  }

  const AppTheme();

  static bool isDarkTheme(context) {
    try {
      final theme = Theme.of(context);
      return theme.brightness == Brightness.dark;
    } catch (_) {
      return false;
    }
  }
}
