import 'package:base_themes/base_color.dart';
import 'package:base_widgets/images/personal_info/avatar_is_blocked.dart';
import 'package:base_widgets/images/personal_info/avatar_item.dart';
import 'package:base_widgets/tooltips/tooltip.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar(
      {super.key,
      required this.dataAvatar,
      this.messageTooltip = 'message',
      this.isUnlocked = false,
      required this.onChoose});

  final List<Map> dataAvatar;
  final String messageTooltip;
  final bool isUnlocked;
  final VoidCallback onChoose;
  List<Map> getAvatarUnlocked() {
    return dataAvatar.where((element) => element['isLocked'] == false).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    final data = (isUnlocked ? getAvatarUnlocked() : dataAvatar);
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x5),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: SpacingUnit.x1,
          childAspectRatio: 0.8),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => onChoose.call(),
          child: !data[index]["isLocked"]
              ? AvatarItem(
                  image: data[index]["image"],
                  imageWidth: SpacingUnit.x16_5,
                  isSelected: data[index]["isSelected"])
              : Tooltip(
                  message: messageTooltip,
                  margin: const EdgeInsets.all(SpacingUnit.x3),
                  decoration: ShapeDecoration(
                    color: colors.surfaceContainerLowest,
                    shape: const TooltipCustom(),
                    shadows: [
                      BoxShadow(
                          color: colors.tonalPalettes.secondary.tp600
                              .withOpacity(0.1),
                          blurRadius: SpacingUnit.x3)
                    ],
                  ),
                  textStyle: theme.textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface),
                  preferBelow: false,
                  child: UserAvatarBlocked(
                      image: data[index]["image"],
                      imageWidth: SpacingUnit.x16_5),
                ),
        );
      },
    );
  }
}
