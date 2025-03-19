import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ProfessionalSpaceship extends StatelessWidget {
  final String title;
  final int level;
  final int used;
  final String bgImageSpaceShip;
  final String imageSpaceShip;
  const ProfessionalSpaceship(
      {super.key,
      this.title = 'title',
      this.level = 0,
      this.used = 0,
      required this.bgImageSpaceShip,
      required this.imageSpaceShip});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x7_5),
      margin:
          const EdgeInsets.only(left: SpacingUnit.x7, right: SpacingUnit.x8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(SpacingUnit.x3)),
          gradient: LinearGradient(colors: [
            colors.surfaceContainerLow.withOpacity(0),
            colors.surfaceContainerLow
          ])),
      height: SpacingUnit.x25,
      child: Row(
        children: [
          const SizedBox(width: SpacingUnit.x2_5),
          Expanded(
              flex: 20,
              child: Container(
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(bgImageSpaceShip))),
                child: Image.asset(imageSpaceShip),
              )),
          const SizedBox(width: SpacingUnit.x2_5),
          Expanded(
              flex: 17,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: SpacingUnit.x6,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          color: colors.textSecondary)),
                  Text('Level $level',
                      style: TextStyle(
                          fontSize: SpacingUnit.x4,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          color: colors.textTertiary)),
                  Text('Used: $used',
                      style: TextStyle(
                          fontSize: SpacingUnit.x3_5,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: colors.textTertiary.withOpacity(0.5))),
                ],
              )),
          const SizedBox(width: SpacingUnit.x2_5),
        ],
      ),
    );
  }
}
