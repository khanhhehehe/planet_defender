import 'package:planet_defender/domain/entities/tag_user.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/dialog/tooltip.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';

class ChooseTag extends StatelessWidget {
  const ChooseTag(
      {super.key,
      required this.tags,
      this.messageTooltip = 'message',
      this.isUnlocked = false,
      required this.onChoose});

  final List<TagUser> tags;
  final String messageTooltip;
  final bool isUnlocked;
  final VoidCallback onChoose;
  List<TagUser> getTagsUnlocked() {
    return tags.where((element) => element.isLock == false).toList();
  }

  @override
  Widget build(BuildContext context) {
    final data = (isUnlocked ? getTagsUnlocked() : tags);
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4_5),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: SpacingUnit.x6,
          mainAxisSpacing: SpacingUnit.x6,
          childAspectRatio: 1.7),
      itemBuilder: (BuildContext context, int index) {
        return !data[index].isLock
            ? ButtonTags(
                tags: data,
                index: index,
                isSelected: index == 0 ? true : false,
              )
            : ButtonTagsBlock(
                messageTooltip: messageTooltip, tags: data, index: index);
      },
    );
  }
}

class ButtonTagsBlock extends StatelessWidget {
  const ButtonTagsBlock(
      {super.key,
      required this.messageTooltip,
      required this.tags,
      required this.index});

  final String messageTooltip;
  final List<TagUser> tags;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Tooltip(
      message: messageTooltip,
      margin: const EdgeInsets.all(SpacingUnit.x3),
      decoration: ShapeDecoration(
        color: colors.surfaceContainerLowest,
        shape: const TooltipCustom(),
        shadows: [
          BoxShadow(
              color: colors.tonalPalettes.secondary.tp600,
              blurRadius: SpacingUnit.x3)
        ],
      ),
      textStyle: TextStyle(
          color: colors.onSurface,
          fontSize: SpacingUnit.x3_5,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic),
      preferBelow: false,
      child: Stack(children: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SpacingUnit.x3)),
                minimumSize: const Size(double.infinity, double.infinity),
                backgroundColor: theme.colorScheme.surface),
            onPressed: () {},
            child: Text(tags[index].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1,
                    fontSize: SpacingUnit.x3_5,
                    fontWeight: FontWeight.w400,
                    color: colors.textSecondary.withOpacity(0.5)))),
        Container(
          padding: const EdgeInsets.all(SpacingUnit.x2_5),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpacingUnit.x3)),
          child: const Icon(
            Icons.lock,
            size: SpacingUnit.x5,
          ),
        )
      ]),
    );
  }
}

class ButtonTags extends StatelessWidget {
  const ButtonTags(
      {super.key,
      required this.tags,
      required this.index,
      this.isSelected = false});

  final List<TagUser> tags;
  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(SpacingUnit.x3)),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: SpacingUnit.x0_5),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(SpacingUnit.x0_5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpacingUnit.x3),
              color: theme.colorScheme.onSurface,
              gradient: isSelected
                  ? LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: colors.gradientBlueLight)
                  : null),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SpacingUnit.x3)),
                  backgroundColor: theme.colorScheme.onSurface),
              child: Text(tags[index].title,
                  style: TextStyle(
                      fontSize: SpacingUnit.x3_5, color: colors.textTertiary))),
        ),
      ),
    ]);
  }
}
