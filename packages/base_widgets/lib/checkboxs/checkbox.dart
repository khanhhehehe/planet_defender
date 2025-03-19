import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {
  final bool isChecked;
  final Color isCheckedColor;
  final Color isNotCheckedColor;
  final ValueChanged onChange;
  const AppCheckBox(
      {super.key,
      required this.isChecked,
      required this.isCheckedColor,
      required this.onChange,
      required this.isNotCheckedColor});

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.isChecked,
      activeColor: widget.isCheckedColor,
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return widget.isCheckedColor;
        }
        return widget.isNotCheckedColor;
      }),
      onChanged: (value) => widget.onChange(value),
      side: const BorderSide(width: 0, color: Colors.transparent),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SpacingUnit.x1)),
    );
  }
}
