import 'package:planet_defender/domain/entities/game_history.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/item_score.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDiary extends StatelessWidget {
  const ItemDiary(
      {super.key,
      required this.onSelected,
      required this.gameHistory,
      required this.index,
      this.isSelected = false});

  final List<GameHistory> gameHistory;
  final int index;
  final bool isSelected;
  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return InkWell(
      onTap: () => onSelected(index),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpacingUnit.x2_5),
              color: isSelected
                  ? colors.surfaceDim
                  : colors.surfaceContainerLowest,
            ),
            padding: const EdgeInsets.all(SpacingUnit.x2),
            child: Row(
              children: [
                Expanded(
                    child: Center(
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: SpacingUnit.x0_25,
                                bottom: SpacingUnit.x0_25,
                                left: SpacingUnit.x1,
                                right: SpacingUnit.x5_5),
                            decoration: BoxDecoration(
                                image: isSelected
                                    ? DecorationImage(
                                        image: AssetImage(Assets
                                            .images.backgroundSpaceship.path))
                                    : null),
                            child: Image.asset(Assets.images.spaceship.path)))),
                Expanded(
                    child: Center(
                        child: Text(
                  gameHistory[index].roundNumber.toString(),
                  style: theme.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600, color: colors.textSecondary),
                ))),
                Expanded(
                    child: Center(
                        child: Text(gameHistory[index].score.toString(),
                            style: theme.textTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colors.textSecondary)))),
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(_formatDateTime(gameHistory[0].createdDate),
                            style: theme.textTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colors.textSecondary)))),
              ],
            ),
          ),
          const SizedBox(height: SpacingUnit.x1),
          if (isSelected)
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: SpacingUnit.x4, vertical: SpacingUnit.x2_5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                Assets.images.backGroundDiaryItem.path),
                            fit: BoxFit.fill)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ItemScore(
                          iconImage: Assets.images.destroyed.path,
                          text: gameHistory[index].destroyNumber.toString(),
                        ),
                        const SizedBox(width: SpacingUnit.x6),
                        ItemScore(
                          iconImage: Assets.images.aimMissed.path,
                          text: gameHistory[index].comboNumber.toString(),
                        ),
                        const SizedBox(width: SpacingUnit.x6),
                        ItemScore(
                          iconImage: Assets.images.coin.path,
                          text: gameHistory[index].coin.toString(),
                        ),
                        const SizedBox(width: SpacingUnit.x6)
                      ],
                    ),
                  ),
                ),
              ],
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}

String _formatDateTime(DateTime? date) {
  if (date != null) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
  return '';
}
