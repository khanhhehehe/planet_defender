import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class CustomSelectButton extends StatelessWidget {
  const CustomSelectButton(
      {super.key,
      required this.callback,
      this.textButton = '',
      this.height = 40,
      this.colorGradient,
      this.colorText = Colors.white,
      this.borderRadius = 4,
      this.value = false,
      this.shadowColor,
      this.hasIcon = false});

  final VoidCallback callback;
  final String textButton;
  final double height;
  final Color colorText;
  final List<Color>? colorGradient;
  final double borderRadius;
  final bool value;
  final Color? shadowColor;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: shadowColor ?? colors.tertiary,
              blurRadius: 0,
              offset: const Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
            colors: colorGradient ?? colors.gradientNavy,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          hasIcon
              ? Icon(
                  Icons.navigate_before,
                  color: colors.onPrimary,
                )
              : const SizedBox(),
          TextButton(
            onPressed: () {
              callback.call();
            },
            child: Text(
              textButton,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: SpacingUnit.x4,
                fontWeight: FontWeight.w600,
                color: colorText,
              ),
            ),
          ),
          hasIcon
              ? Icon(
                  Icons.navigate_next,
                  color: colors.onPrimary,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
