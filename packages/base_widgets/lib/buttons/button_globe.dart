import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class GameButtonGlobe extends StatefulWidget {
  final String textGlobe;
  final String imagePath;
  const GameButtonGlobe(
      {super.key, this.textGlobe = 'EN', this.imagePath = 'image path'});

  @override
  State<GameButtonGlobe> createState() => _GameButtonGlobeState();
}

class _GameButtonGlobeState extends State<GameButtonGlobe> {
  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Container(
      color: colors.tonalPalettes.secondary.tp900,
      padding: const EdgeInsets.symmetric(
          horizontal: SpacingUnit.x4, vertical: SpacingUnit.x2_5),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(SpacingUnit.x2))),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(widget.textGlobe,
            style: const TextStyle(
                color: Color(0xFFA5D4FF),
                fontSize: SpacingUnit.x3_5,
                fontWeight: FontWeight.w700)),
        Image(image: AssetImage(widget.imagePath))
      ]),
    );
  }
}
