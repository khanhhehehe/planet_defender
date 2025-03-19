import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppLabelWarning extends StatelessWidget {
  final String imageIcon;
  final String titleWarning;
  final TextStyle? titleStyle;
  const AppLabelWarning(
      {super.key,
      this.imageIcon = '',
      this.titleWarning = 'title warning',
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imageIcon != ''
            ? Image.asset(imageIcon)
            : Icon(
                Icons.warning_amber_outlined,
                color: theme.colorScheme.error,
              ),
        const SizedBox(
          width: SpacingUnit.x2_5,
        ),
        Text(
          titleWarning,
          style: titleStyle,
        ),
      ],
    );
  }
}
