import 'package:planet_defender/presentations/themes/color_style.dart';
import 'package:planet_defender/presentations/themes/tonal_palettes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

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
  final TonalPalettes tonalPalettes;
  final Color surfaceDim;

  const BaseThemeColor(
      {required this.brightness,
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
      required this.tonalPalettes,
      required this.surfaceDim});

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
}
