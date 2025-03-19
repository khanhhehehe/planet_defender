import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class AvatarItem extends StatelessWidget {
  final String image;
  final double? imageWidth;
  final bool isSelected;
  final String? backgroundImage;
  const AvatarItem(
      {super.key,
      required this.image,
      this.imageWidth,
      this.isSelected = false,
      this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
              color: isSelected
                  ? const Color(0xFF3989FF)
                  : theme.colorScheme.secondary,
              cornerRadius: SpacingUnit.x2_5,
            ),
          ],
        ),
        HexagonWidget.pointy(
          width: imageWidth ?? SpacingUnit.x30,
          padding: SpacingUnit.x2_5,
          color: colors.surface,
          cornerRadius: SpacingUnit.x2_5,
          child: Container(
            decoration: BoxDecoration(
                gradient: isSelected
                    ? LinearGradient(
                        colors: colors.gradientBlueLight,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)
                    : null),
            child: HexagonWidget.pointy(
              width: isSelected
                  ? imageWidth! - SpacingUnit.x5_5
                  : imageWidth! - SpacingUnit.x4_5,
              cornerRadius: SpacingUnit.x2_5,
              child: HexagonWidget.pointy(
                  width: imageWidth != null
                      ? (imageWidth! - SpacingUnit.x4_5)
                      : SpacingUnit.x26,
                  color: colors.surface,
                  cornerRadius: SpacingUnit.x2_5,
                  padding: 4,
                  child: Image.asset(image)),
            ),
          ),
        ),
      ]),
    );
  }
}
