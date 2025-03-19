import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ButtonClose extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  const ButtonClose({super.key, required this.onPress, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: const Color(0xFF5280FF),
            borderRadius: BorderRadius.circular(SpacingUnit.x3)),
        height: SpacingUnit.x11,
        width: SpacingUnit.x10,
      ),
      Container(
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(SpacingUnit.x3)),
        height: SpacingUnit.x10,
        width: SpacingUnit.x10,
        child: IconButton(onPressed: () => onPress.call(), icon: child),
      )
    ]);
  }
}
