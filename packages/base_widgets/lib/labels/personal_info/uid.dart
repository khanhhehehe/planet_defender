import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppLabelUID extends StatelessWidget {
  final String titleUid;
  final TextStyle? titleStyle;
  final String userId;
  final String icon;
  final VoidCallback onCopy;
  final String titleFsel;
  final String accountType;
  const AppLabelUID(
      {super.key,
      this.titleUid = 'UID: ',
      this.titleStyle,
      this.userId = '',
      this.icon = 'icon',
      required this.onCopy,
      this.titleFsel = '',
      this.accountType = ''});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '$titleUid$userId',
                style: theme.textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.surfaceContainerBright),
              ),
              const SizedBox(width: SpacingUnit.x1),
              IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => onCopy.call(),
                  icon: Image.asset(icon))
            ],
          ),
          Text(accountType,
              style: theme.textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  color: colors.surfaceContainerLow))
        ],
      ),
    );
  }
}
