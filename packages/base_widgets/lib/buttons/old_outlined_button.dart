import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class OldOutlineButton extends StatefulWidget {
  final bool isEnabledButton;
  const OldOutlineButton({super.key, this.isEnabledButton = false});

  @override
  State<OldOutlineButton> createState() => _OldOutlineButtonState();
}

class _OldOutlineButtonState extends State<OldOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 84,
          width: 84,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpacingUnit.x6),
              border: Border.all(width: 2, color: const Color(0xFFA5D4FF)),
              boxShadow: widget.isEnabledButton
                  ? const [
                      BoxShadow(color: Color(0xFF4BBEFF)),
                      BoxShadow(
                        color: Color(0xFF1A2C58),
                        spreadRadius: -4.0,
                        blurRadius: SpacingUnit.x3,
                      )
                    ]
                  : []),
          child: const Center(
              child: Image(
            image: AssetImage('packages/base_widgets/assets/vector.png'),
          ))),
    );
  }
}
