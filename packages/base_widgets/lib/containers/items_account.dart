import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ItemsAccount extends StatelessWidget {
  const ItemsAccount(
      {super.key, this.isSelected = false, required this.callback});
  final bool isSelected;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return GestureDetector(
      onTap: () {
        callback.call();
      },
      child: Container(
        height: SpacingUnit.x21,
        width: MediaQuery.of(context).size.width - SpacingUnit.x11,
        padding: const EdgeInsets.only(
            top: SpacingUnit.x2,
            right: SpacingUnit.x3,
            bottom: SpacingUnit.x2,
            left: SpacingUnit.x4),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.surface
              : theme.colorScheme.surface.withOpacity(0.4),
          borderRadius: BorderRadius.circular(SpacingUnit.x1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Guest account',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: SpacingUnit.x2_75,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                isSelected
                    ? Image.asset(
                        'images/circle_successful.png',
                        height: SpacingUnit.x4_5,
                      )
                    : const SizedBox()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cosmo',
                      style: theme.textTheme.labelLarge?.copyWith(
                          fontSize: SpacingUnit.x3_5,
                          fontWeight: FontWeight.w600,
                          color: colors.surfaceContainerBrightest),
                    ),
                    Text(
                      'Level 15',
                      style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: SpacingUnit.x2_75,
                          fontWeight: FontWeight.w600,
                          color: colors.surfaceContainerLow),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'images/Coin.png',
                      height: SpacingUnit.x5,
                    ),
                    const SizedBox(
                      width: SpacingUnit.x2_5,
                    ),
                    Text(
                      '20.000',
                      style: theme.textTheme.labelLarge?.copyWith(
                          fontSize: SpacingUnit.x3_5,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
