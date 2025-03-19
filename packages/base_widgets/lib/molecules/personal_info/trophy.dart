import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class TrophyInfo extends StatelessWidget {
  final String content;
  final String title;
  const TrophyInfo({
    super.key,
    this.content = '10',
    this.title = 'title',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Container(
        padding: const EdgeInsets.only(
            top: SpacingUnit.x4,
            left: SpacingUnit.x4,
            bottom: SpacingUnit.x4,
            right: SpacingUnit.x10_5),
        decoration: BoxDecoration(
            color: colors.surfaceDim,
            borderRadius: BorderRadius.circular(SpacingUnit.x3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content,
                style: TextStyle(
                    color: colors.textSecondary,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    fontSize: SpacingUnit.x8)),
            Text(
              title,
              style: theme.textTheme.labelLarge!.copyWith(
                  fontStyle: FontStyle.italic, color: colors.textDark),
            )
          ],
        ));
  }
}
