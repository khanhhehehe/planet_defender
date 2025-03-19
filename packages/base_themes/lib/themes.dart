import 'package:flutter/material.dart';

import 'base_color.dart';
import 'base_theme.dart';
import 'text_style.dart';

class AppTheme implements BaseTheme {
  static BaseThemeColor getColors(BuildContext context) {
    return BaseThemeColor.of(context);
  }

  @override
  ThemeData darkTheme(context) {
    return ThemeData(
        textTheme: getTextTheme(context),
        colorScheme: BaseThemeColor.colorSchemeThemeDark());
  }

  @override
  ThemeData lightTheme(context) {
    return ThemeData(
        textTheme: getTextTheme(context),
       
        colorScheme: BaseThemeColor.colorSchemeThemeLight());
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
