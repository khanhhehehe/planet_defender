import 'package:base_themes/base_color.dart';
import 'package:common/utils/date_utils.dart';
import 'package:flutter/material.dart';

class AppLabelResentOTP extends StatelessWidget {
  final String titleResentOTP;
  final TextStyle? titleStyle;
  final int time;
  final TextStyle? timeTextStyle;
  const AppLabelResentOTP({
    super.key,
    this.titleResentOTP = 'Resent OTP in ',
    this.titleStyle,
    this.timeTextStyle,
    this.time = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: titleResentOTP,
          style: titleStyle ??
              theme.textTheme.labelSmall
                  ?.copyWith(color: colors.surfaceContainerLow)),
      TextSpan(
          text: formatHHMMSS(time),
          style: timeTextStyle ??
              theme.textTheme.labelSmall?.copyWith(
                  color: colors.surfaceContainerLow,
                  fontWeight: FontWeight.w600)),
    ]));
  }
}
