import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:hexagon/hexagon.dart';

class UserAvatarBlocked extends StatelessWidget {
  final String image;
  final double? imageWidth;
  const UserAvatarBlocked({super.key, required this.image, this.imageWidth});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final theme = Theme.of(context);
    return Stack(alignment: Alignment.center, children: [
      HexagonWidget.pointy(
          width: imageWidth != null
              ? (imageWidth! - SpacingUnit.x4_5)
              : SpacingUnit.x26,
          color: colors.surfaceDim,
          cornerRadius: SpacingUnit.x2,
          padding: SpacingUnit.x1,
          child: Image.asset(image)),
      HexagonWidget.pointy(
        width: imageWidth != null
            ? (imageWidth! - SpacingUnit.x4_5)
            : SpacingUnit.x26,
        color: colors.surfaceContainerBright.withOpacity(0.8),
        cornerRadius: SpacingUnit.x2,
        child: Icon(Icons.lock, color: theme.colorScheme.onSurface),
      ),
    ]);
  }
}
