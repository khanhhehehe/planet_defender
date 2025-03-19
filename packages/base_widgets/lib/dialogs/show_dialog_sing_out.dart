import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:base_widgets/gen/assets.gen.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog(
    {required BuildContext context,
    String content = '',
    String textButtonLeft = '',
    String textButtonRight = '',
    String title = '',
    required VoidCallback onContinue,
    required VoidCallback onCancel}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      final theme = Theme.of(context);
      final colors = BaseThemeColor.of(context);
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SpacingUnit.x2)),
        backgroundColor: colors.onPrimary,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.triangleWarning.path,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: theme.textTheme.labelLarge?.copyWith(
                    color: colors.error,
                    fontWeight: FontWeight.w600,
                    fontSize: SpacingUnit.x3_5),
              )
            ]),
        content: Text(content,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelLarge?.copyWith(
                color: colors.textSecondary, fontWeight: FontWeight.w600)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomSelectButton(
                  callback: () => onCancel.call(),
                  colorGradient: colors.gradientNavy,
                  textButton: textButtonLeft,
                ),
              ),
              const SizedBox(width: SpacingUnit.x4),
              Expanded(
                child: CustomSelectButton(
                  callback: () => onContinue.call(),
                  colorGradient: colors.gradientLight,
                  textButton: textButtonRight,
                  colorText: colors.surfaceContainer,
                  shadowColor: colors.surfaceContainer,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: SpacingUnit.x2_5,
          )
        ],
      );
    },
  );
}
