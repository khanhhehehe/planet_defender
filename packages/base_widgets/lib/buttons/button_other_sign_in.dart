import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ButtonOtherSignIn extends StatelessWidget {
  final String buttonImage;
  final VoidCallback onPressed;
  const ButtonOtherSignIn(
      {super.key, required this.buttonImage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(buttonImage),
      iconSize: SpacingUnit.x10,
      onPressed: () => onPressed,
    );
  }
}
