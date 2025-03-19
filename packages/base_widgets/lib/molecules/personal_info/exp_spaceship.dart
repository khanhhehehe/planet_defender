import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ExpSpaceShip extends StatelessWidget {
  final String spaceShipImage;
  final int index;
  const ExpSpaceShip(
      {super.key,
      required this.spaceShips,
      required this.index,
      required this.spaceShipImage});

  final List<String> spaceShips;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: index == 0 ? 1 : 0.4,
      child: Container(
        width: SpacingUnit.x21_5,
        height: SpacingUnit.x10_5,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: index == 0
                    ? AssetImage(spaceShipImage)
                    : AssetImage(spaceShipImage),
                fit: BoxFit.fill)),
        child: Image.asset(spaceShips[index]),
      ),
    );
  }
}
