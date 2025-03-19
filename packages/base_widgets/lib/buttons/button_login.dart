import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ButtonLoginDifferent extends StatelessWidget {
  final String imageName;
  final Color iconBackGroundColor;
  const ButtonLoginDifferent(
      {super.key, required this.imageName, required this.iconBackGroundColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Container(
            width: SpacingUnit.x21,
            height: SpacingUnit.x12,
            color: iconBackGroundColor,
            child: Image.asset(imageName)));
  }
}
