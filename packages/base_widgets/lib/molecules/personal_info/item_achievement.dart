import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ItemAchievement extends StatelessWidget {
  final String nameAchievement;
  final String? icon;
  final String score;
  const ItemAchievement({
    super.key,
    this.nameAchievement = 'name',
    this.icon,
    this.score = '10/40',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Container(
      width: SpacingUnit.x29_25,
      padding: const EdgeInsets.symmetric(vertical: SpacingUnit.x2_5),
      decoration: BoxDecoration(
          color: colors.surfaceDim,
          borderRadius: BorderRadius.circular(SpacingUnit.x3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nameAchievement,
            style: theme.textTheme.labelLarge!.copyWith(color: colors.textDark),
          ),
          const SizedBox(height: SpacingUnit.x1),
          SizedBox(
            height: SpacingUnit.x10,
            width: SpacingUnit.x10,
            child: icon != null ? Image.asset(icon!) : null,
          ),
          const SizedBox(height: SpacingUnit.x1),
          Text(
            score,
            style: theme.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w700, color: colors.textSecondary),
          )
        ],
      ),
    );
  }
}
