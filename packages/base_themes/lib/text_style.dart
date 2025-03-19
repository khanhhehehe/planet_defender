import 'package:flutter/material.dart';
import 'base_text_theme.dart';
import 'themes.dart';

TextTheme getTextTheme(context) {
  final colors = AppTheme.getColors(context);
  return TextTheme(
    displayLarge:
        TypographyTheme.interDisplay.t57R.copyWith(color: colors.text),
    displayMedium:
        TypographyTheme.interDisplay.t45R.copyWith(color: colors.text),
    displaySmall:
        TypographyTheme.interDisplay.t36R.copyWith(color: colors.text),
    headlineLarge:
        TypographyTheme.interHeadline.t32R.copyWith(color: colors.text),
    headlineMedium:
        TypographyTheme.interHeadline.t28R.copyWith(color: colors.text),
    headlineSmall:
        TypographyTheme.interHeadline.t24R.copyWith(color: colors.text),
    titleLarge: TypographyTheme.interTitle.t22R.copyWith(color: colors.text),
    titleMedium: TypographyTheme.interTitle.t16R.copyWith(color: colors.text),
    titleSmall: TypographyTheme.interTitle.t14R.copyWith(color: colors.text),
    bodyLarge: TypographyTheme.interBody.t16R.copyWith(color: colors.text),
    bodyMedium: TypographyTheme.interBody.t14R.copyWith(color: colors.text),
    bodySmall: TypographyTheme.interBody.t12R.copyWith(color: colors.text),
    labelLarge: TypographyTheme.interLabel.t14R.copyWith(color: colors.text),
    labelMedium: TypographyTheme.interLabel.t12R.copyWith(color: colors.text),
    labelSmall: TypographyTheme.interLabel.t11R.copyWith(color: colors.text),
  );
}
