import 'package:planet_defender/gen/assets.gen.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/text_button.dart';
import 'package:base_widgets/molecules/signin_signup/label_warning.dart';
import 'package:flutter/material.dart';

class SuccessfulPage extends StatelessWidget {
  final String titleWarning;
  final String content;
  final String textHint;
  final VoidCallback onPressed;
  final Color? titleColor;
  const SuccessfulPage(
      {super.key,
      required this.titleWarning,
      required this.content,
      required this.textHint,
      required this.onPressed,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Column(
      children: [
        AppLabelWarning(
          titleWarning: titleWarning,
          imageIcon: Assets.images.circleSuccessful.path,
          titleStyle: theme.textTheme.labelLarge?.copyWith(
              color: titleColor ?? colors.tonalPalettes.warning.tp700),
        ),
        const SizedBox(
          height: SpacingUnit.x3_5,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
          child: Text(
            content,
            style: theme.textTheme.labelLarge
                ?.copyWith(color: colors.tonalPalettes.neutral.tp300),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: SpacingUnit.x12,
        ),
        AppTextButton(
          onPressed: onPressed,
          textHint: textHint,
          textColor: colors.tonalPalettes.primary.tp500,
          isShowRightIcon: true,
          imageIconPath: Assets.images.chevronRight.path,
        ),
      ],
    );
  }
}
