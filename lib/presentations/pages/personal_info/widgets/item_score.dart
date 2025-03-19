import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';

class ItemScore extends StatelessWidget {
  final String iconImage;
  final String text;
  const ItemScore({super.key, required this.iconImage, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(iconImage),
        const SizedBox(width: SpacingUnit.x1),
        Text(
          text,
          style: theme.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w600, color: colors.textSecondary),
        )
      ],
    );
  }
}
