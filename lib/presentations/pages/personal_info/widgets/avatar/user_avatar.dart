import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:hexagon/hexagon.dart';

class UserAvatar extends StatelessWidget {
  final String image;
  final double? imageWidth;
  final bool isSelected;
  final String? backgroundImage;
  const UserAvatar(
      {super.key,
      required this.image,
      this.imageWidth,
      this.isSelected = false,
      this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Container(
      decoration: BoxDecoration(
          image: backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(backgroundImage!), fit: BoxFit.fitWidth)
              : null),
      child: Stack(alignment: Alignment.center, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 7),
            HexagonWidget.pointy(
              width: imageWidth != null
                  ? (imageWidth! - SpacingUnit.x4_5)
                  : SpacingUnit.x26,
              color: colors.tertiary,
              cornerRadius: SpacingUnit.x2_5,
            ),
          ],
        ),
        HexagonWidget.pointy(
          width: imageWidth ?? SpacingUnit.x30,
          padding: SpacingUnit.x2_5,
          color: colors.onPrimary,
          cornerRadius: SpacingUnit.x2_5,
          child: Container(
            decoration: BoxDecoration(
                gradient: isSelected
                    ? LinearGradient(
                        colors: colors.gradientBlueLight,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    : null),
            child: HexagonWidget.pointy(
                width: imageWidth != null
                    ? (imageWidth! - SpacingUnit.x4)
                    : SpacingUnit.x26,
                color: colors.onPrimary,
                cornerRadius: SpacingUnit.x2_5,
                padding: SpacingUnit.x2_5,
                child: Image.asset(image)),
          ),
        ),
      ]),
    );
  }
}
