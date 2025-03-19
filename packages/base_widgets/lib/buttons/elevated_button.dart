import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatefulWidget {
  final String textButton;
  final bool isEnabled;
  final List<Color>? enabledBackgroundColor;
  final Color? disabledColor;
  final Color? firstEnabledShadowColor;
  final Color? firstDisabledShadowColor;
  final Color? secondEnabledShadowColor;
  final Color? secondDisabledShadowColor;
  final Color? textColor;
  final bool isShowIcon;
  final Widget? nameIcon;
  final String backgroundImage;
  final String iconWarning;
  final VoidCallback onContinue;
  const AppElevatedButton(
      {super.key,
      this.isEnabled = false,
      this.textButton = 'title',
      this.enabledBackgroundColor,
      this.disabledColor,
      this.firstEnabledShadowColor,
      this.firstDisabledShadowColor,
      this.secondEnabledShadowColor,
      this.secondDisabledShadowColor,
      this.textColor,
      this.isShowIcon = false,
      this.nameIcon,
      required this.onContinue,
      this.backgroundImage = 'image path',
      this.iconWarning = 'icon path'});

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SpacingUnit.x1),
          color: colors.shadowButton,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 4,
                color: colors.shadowButton.withOpacity(0.25)),
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                color: colors.shadowButton.withOpacity(0.12)),
            BoxShadow(offset: const Offset(0, 2), color: colors.shadowButton)
          ]),
      child: Container(
        width: double.infinity,
        height: SpacingUnit.x10,
        margin: const EdgeInsets.only(bottom: SpacingUnit.x0_5),
        decoration: BoxDecoration(
          color: widget.isEnabled ? null : colors.primary,
          borderRadius: BorderRadius.circular(SpacingUnit.x1),
          gradient: widget.isEnabled
              ? LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors:
                      (widget.enabledBackgroundColor ?? colors.gradientNavy))
              : null,
        ),
        child: ElevatedButton(
          onPressed: widget.isEnabled ? () => widget.onContinue.call() : null,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SpacingUnit.x1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.textButton,
                style: theme.textTheme.bodyLarge!.copyWith(
                    color: widget.isEnabled
                        ? colors.onPrimary
                        : colors.onPrimaryContainer,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Visibility(
                  visible: widget.isShowIcon,
                  child: Icon(
                    Icons.navigate_next,
                    color: theme.colorScheme.onPrimary,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
