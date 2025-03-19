import 'package:base_themes/base_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppLabelLoginNow extends StatelessWidget {
  final String firstText;
  final TextStyle? firstTextStyle;
  final String secondText;
  final TextStyle? secondTextStyle;
  final String thirdText;
  final TextStyle? thirdTextStyle;
  final VoidCallback onBackLogin;
  const AppLabelLoginNow(
      {super.key,
      this.firstText = 'If you already have an account, ',
      this.firstTextStyle,
      this.secondText = 'login now',
      this.secondTextStyle,
      this.thirdText = ' to sign in',
      this.thirdTextStyle,
      required this.onBackLogin});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: firstText,
              style: firstTextStyle ??
                  theme.textTheme.labelSmall
                      ?.copyWith(color: colors.textSecondary)),
          TextSpan(
              text: secondText,
              recognizer: TapGestureRecognizer()
                ..onTap = () => onBackLogin.call(),
              style: secondTextStyle ??
                  theme.textTheme.labelMedium?.copyWith(
                    decoration: TextDecoration.underline,
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  )),
          TextSpan(
              text: thirdText,
              style: thirdTextStyle ??
                  theme.textTheme.labelSmall
                      ?.copyWith(color: colors.textSecondary)),
        ]));
  }
}
