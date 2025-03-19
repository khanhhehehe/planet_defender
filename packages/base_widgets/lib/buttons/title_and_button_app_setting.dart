import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class TitleAndButtonAppSetting extends StatelessWidget {
  const TitleAndButtonAppSetting(
      {super.key,
      this.titleLeft = '',
      this.textButton = '',
      this.titleRight = '',
      required this.callback,
      this.hasIcon = false});

  final String titleLeft;
  final String titleRight;
  final String textButton;
  final VoidCallback callback;
  final bool hasIcon;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleLeft,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                fontSize: SpacingUnit.x2_75,
              ),
            ),
            Text(
              titleRight,
              style: theme.textTheme.labelSmall?.copyWith(
                  color: colors.surfaceBright,
                  fontWeight: FontWeight.w700,
                  fontSize: SpacingUnit.x2_75,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
        const SizedBox(
          height: SpacingUnit.x1,
        ),
        CustomSelectButton(
          callback: () {
            callback.call();
          },
          textButton: textButton,
          hasIcon: hasIcon,
        )
      ],
    );
  }
}
