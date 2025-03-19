import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textHint;
  final Color? textColor;
  final bool isShowRightIcon;
  final String imageIconPath;
  final double buttonHeight;
  final bool isShowLeftIcon;
  final Widget? iconLeft;
  const AppTextButton({
    super.key,
    this.textHint = 'text hint',
    this.textColor,
    this.isShowRightIcon = false,
    this.imageIconPath = 'image path',
    this.buttonHeight = 40,
    this.isShowLeftIcon = false,
    this.iconLeft,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return SizedBox(
      width: double.infinity,
      height: SpacingUnit.x10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextButton(
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isShowLeftIcon,
                    child: iconLeft ??
                        Icon(
                          Icons.navigate_before,
                          color: colors.textSecondary,
                        ),
                  ),
                  Text(textHint,
                      style: theme.textTheme.bodyLarge!.copyWith(
                          color: textColor ?? colors.textTertiary,
                          fontWeight: FontWeight.w700)),
                  Visibility(
                      visible: isShowRightIcon,
                      child: Image.asset(imageIconPath))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
