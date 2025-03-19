import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planet_defender/gen/assets.gen.dart';

class ItemWikiBook extends StatelessWidget {
  final int index;
  final String image;
  final String name;
  final bool isLock;
  final VoidCallback onSelect;
  final ValueChanged<int> onSelectIndex;
  const ItemWikiBook(
      {super.key,
      required this.index,
      required this.onSelect,
      required this.onSelectIndex,
      this.image = '',
      this.name = '',
      this.isLock = false});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Container(
      decoration: BoxDecoration(
          color: colors.surfaceContainerLowest.withOpacity(isLock ? 0.5 : 1),
          borderRadius: BorderRadius.circular(SpacingUnit.x3)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: colors.surface,
          borderRadius: BorderRadius.circular(SpacingUnit.x3),
          onTap: () {
            onSelect.call();
            onSelectIndex(index);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x2),
            child: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: isLock ? 0.5 : 1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: double.infinity),
                        Image.asset(
                          image,
                          width: SpacingUnit.x18,
                          height: SpacingUnit.x18,
                        ),
                        const SizedBox(height: SpacingUnit.x0_25),
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic),
                        )
                      ]),
                ),
              ),
              isLock
                  ? Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(Assets.svg.lock))
                  : const SizedBox(),
            ]),
          ),
        ),
      ),
    );
  }
}