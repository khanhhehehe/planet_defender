import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class CheckboxPersonalInfo extends StatefulWidget {
  final bool isChecked;
  final Color? checkFillColor;
  final Color notCheckFillColor;
  final Color? borderColor;
  final String titleCheckbox;
  final TextStyle? titleStyle;
  final Color? activeColor;
  final VoidCallback onChange;
  const CheckboxPersonalInfo(
      {super.key,
      required this.isChecked,
      this.checkFillColor,
      required this.notCheckFillColor,
      this.borderColor,
      this.activeColor,
      this.titleCheckbox = 'title',
      this.titleStyle,
      required this.onChange});

  @override
  State<CheckboxPersonalInfo> createState() => _CheckboxPersonalInfoState();
}

class _CheckboxPersonalInfoState extends State<CheckboxPersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: SpacingUnit.x5,
            width: SpacingUnit.x5,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: widget.borderColor ?? Colors.transparent),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(SpacingUnit.x1_5)),
            child: Checkbox(
              value: widget.isChecked,
              activeColor: widget.checkFillColor,
              checkColor: widget.activeColor,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return widget.checkFillColor;
                }
                return widget.notCheckFillColor;
              }),
              onChanged: (value) => widget.onChange.call(),
            )),
        const SizedBox(width: SpacingUnit.x1),
        Text(
          widget.titleCheckbox,
          style: widget.titleStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
