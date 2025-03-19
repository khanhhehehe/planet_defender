import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';

class AppForgotPassword extends StatelessWidget {
  final String titleForgotPassword;
  final TextStyle? forgotPasswordStyle;
  final String titleCreateAccount;
  final TextStyle? createAccountStyle;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onCreateAccount;
  const AppForgotPassword({
    super.key,
    this.titleForgotPassword = 'Forgot password',
    this.forgotPasswordStyle,
    this.titleCreateAccount = 'Create account',
    this.createAccountStyle,
    this.onForgotPassword,
    this.onCreateAccount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onForgotPassword,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            titleForgotPassword,
            style: forgotPasswordStyle ??
                theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600, color: colors.textTertiary),
          ),
        ),
        TextButton(
          onPressed: onCreateAccount,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            titleCreateAccount,
            style: createAccountStyle ??
                theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600, color: colors.primary),
          ),
        )
      ],
    );
  }
}
