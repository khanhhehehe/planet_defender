import 'package:planet_defender/domain/entities/avatar_user.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/avatar/avatar_block.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/avatar/avatar_item.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/dialog/tooltip.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar(
      {super.key,
      required this.avatars,
      this.messageTooltip = 'message',
      this.isUnlocked = false,
      required this.onChoose});

  final List<AvatarUser> avatars;
  final String messageTooltip;
  final bool isUnlocked;
  final VoidCallback onChoose;
  List<AvatarUser> _getAvatarUnlocked() {
    return avatars.where((element) => element.isLock == false).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final theme = Theme.of(context);
    final filterAvatars = (isUnlocked ? _getAvatarUnlocked() : avatars);
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x5),
      itemCount: filterAvatars.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: SpacingUnit.x1,
          childAspectRatio: 0.8),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => onChoose.call(),
          child: _avatarType(filterAvatars, index)
              ? AvatarItem(
                  image: filterAvatars[index].avatar,
                  imageWidth: SpacingUnit.x16_5,
                  isSelected: false)
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
                      image: filterAvatars[index].avatar,
                      imageWidth: SpacingUnit.x16_5),
                ),
        );
      },
    );
  }
}

bool _avatarType(List<AvatarUser> avatars, int index) {
  return avatars[index].isLock;
}
