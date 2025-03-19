import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ButtonRectangle extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final bool isEnabled;
  final String? imageBackground;
  final FontStyle? fontStyle;
  final VoidCallback onPress;
  const ButtonRectangle(
      {super.key,
      this.title = 'title',
      this.isEnabled = false,
      this.titleColor,
      this.fontStyle,
      this.imageBackground,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: isEnabled
                ? (imageBackground != null
                    ? DecorationImage(image: AssetImage(imageBackground!))
                    : null)
                : null),
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: SpacingUnit.x2, top: SpacingUnit.x0_25),
          child: TextButton(
              onPressed: () => onPress.call(),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: SpacingUnit.x3_5,
                    fontWeight: FontWeight.w700,
                    fontStyle: fontStyle,
                    color: titleColor),
              )),
        ));
  }
}
