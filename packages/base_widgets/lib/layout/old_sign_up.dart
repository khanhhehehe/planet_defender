import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class LayoutGameFselOldSignUp extends StatefulWidget {
  final List<Widget> widgetChildren;
  final String pathImage;
  const LayoutGameFselOldSignUp(
      {super.key, required this.widgetChildren, this.pathImage = 'path'});

  @override
  State<LayoutGameFselOldSignUp> createState() =>
      _LayoutGameFselOldSignUpState();
}

class _LayoutGameFselOldSignUpState extends State<LayoutGameFselOldSignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.pathImage), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x5),
        child: Column(children: [
          const SizedBox(height: SpacingUnit.x18, width: double.infinity),
          Column(
            children: widget.widgetChildren,
          ),
        ]),
      ),
    );
  }
}
