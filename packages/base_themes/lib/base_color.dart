import 'package:flutter/material.dart';

import 'color_style.dart';
import 'tonal_palettes.dart';

class BaseThemeColor {
  final Color text;
  final Color textLight;
  final Color title;
  final Color description;
  final Color subTitle;
  final Color brightness;
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;
  final Color surfaceTin;
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color shadowButton;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerBright;
  final Color surfaceContainerBrightest;
  final Color textSecondary;
  final Color textTertiary;
  final Color shade;

  final TonalPalettes tonalPalettes;
  final List<Color> gradientShine;
  final List<Color> gradientVenice;
  final List<Color> gradientBlueLight;
  final List<Color> gradientNavy;
  final List<Color> gradientOrangeFun;
  final List<Color> gradientSoda;
  final List<Color> gradientLight;
  final Color warning;
  final Color textDark;

  const BaseThemeColor({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.text,
    required this.textLight,
    required this.title,
    required this.description,
    required this.subTitle,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.surfaceTin,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.textSecondary,
    required this.textTertiary,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerBright,
    required this.surfaceContainerBrightest,
    required this.shade,
    required this.shadowButton,
    required this.tonalPalettes,
    required this.gradientShine,
    required this.gradientBlueLight,
    required this.gradientNavy,
    required this.gradientOrangeFun,
    required this.gradientSoda,
    required this.gradientVenice,
    required this.gradientLight,
    required this.warning,
    required this.textDark,
  });

  static bool isDarkTheme(context) {
    try {
      final brightness = MediaQuery.of(context).platformBrightness;

      return brightness == Brightness.dark;
    } catch (_) {
      return false;
    }
  }

  factory BaseThemeColor.of(BuildContext context) {
    return isDarkTheme(context)
        ? AppColors.appColorsDark
        : AppColors.appColorsLight;
  }

  static ColorScheme colorSchemeThemeDark() {
    final colors = AppColors.appColorsDark;
    return ColorScheme(
      brightness: Brightness.dark,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.secondary,
      onSecondary: colors.onSecondary,
      error: colors.error,
      onError: colors.onError,
      background: colors.background,
      onBackground: colors.onBackground,
      surface: colors.surface,
      onSurface: colors.onSurface,
      primaryContainer: colors.primaryContainer,
      onPrimaryContainer: colors.onPrimaryContainer,
      secondaryContainer: colors.secondaryContainer,
      onSecondaryContainer: colors.onSecondaryContainer,
      tertiary: colors.tertiary,
      onTertiary: colors.onTertiary,
      tertiaryContainer: colors.tertiaryContainer,
      onTertiaryContainer: colors.onTertiaryContainer,
      errorContainer: colors.errorContainer,
      onErrorContainer: colors.onErrorContainer,
      surfaceVariant: colors.surfaceVariant,
      onSurfaceVariant: colors.onSurfaceVariant,
      outline: colors.outline,
      outlineVariant: colors.outlineVariant,
      shadow: colors.shadow,
      scrim: colors.scrim,
      inverseSurface: colors.inverseSurface,
      onInverseSurface: colors.onInverseSurface,
      inversePrimary: colors.inversePrimary,
    );
  }

  static ColorScheme colorSchemeThemeLight() {
    final colors = AppColors.appColorsLight;
    return ColorScheme(
      brightness: Brightness.light,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.secondary,
      onSecondary: colors.onSecondary,
      error: colors.error,
      onError: colors.onError,
      background: colors.background,
      onBackground: colors.onBackground,
      surface: colors.surface,
      onSurface: colors.onSurface,
      primaryContainer: colors.primaryContainer,
      onPrimaryContainer: colors.onPrimaryContainer,
      secondaryContainer: colors.secondaryContainer,
      onSecondaryContainer: colors.onSecondaryContainer,
      tertiary: colors.tertiary,
      onTertiary: colors.onTertiary,
      tertiaryContainer: colors.tertiaryContainer,
      onTertiaryContainer: colors.onTertiaryContainer,
      errorContainer: colors.errorContainer,
      onErrorContainer: colors.onErrorContainer,
      surfaceVariant: colors.surfaceVariant,
      onSurfaceVariant: colors.onSurfaceVariant,
      outline: colors.outline,
      outlineVariant: colors.outlineVariant,
      shadow: colors.shadow,
      scrim: colors.scrim,
      inverseSurface: colors.inverseSurface,
      onInverseSurface: colors.onInverseSurface,
      inversePrimary: colors.inversePrimary,
    );
  }
}
