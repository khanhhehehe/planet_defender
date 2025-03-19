import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class TooltipCustom extends ShapeBorder {
  const TooltipCustom();

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.symmetric(
      horizontal: SpacingUnit.x4, vertical: SpacingUnit.x2);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(SpacingUnit.x1)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(SpacingUnit.x1_5, SpacingUnit.x1)
      ..relativeLineTo(SpacingUnit.x1_5, -SpacingUnit.x1)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
