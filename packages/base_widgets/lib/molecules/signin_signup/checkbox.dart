import 'package:base_widgets/checkboxs/checkbox.dart';
import 'package:flutter/material.dart';

class AppCheckboxSignup extends StatefulWidget {
  final bool isChecked;
  final Color isCheckedColor;
  final Color isNotCheckedColor;
  final String titleCheckbox;
  final TextStyle? titleStyle;
  final ValueChanged isCheckBox;
  const AppCheckboxSignup({
    super.key,
    required this.isChecked,
    required this.isCheckedColor,
    required this.isNotCheckedColor,
    required this.isCheckBox,
    this.titleCheckbox = 'title',
    this.titleStyle,
  });

  @override
  State<AppCheckboxSignup> createState() => _AppCheckboxSignupState();
}

class _AppCheckboxSignupState extends State<AppCheckboxSignup> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppCheckBox(
          isChecked: widget.isChecked,
          isCheckedColor: widget.isCheckedColor,
          isNotCheckedColor: widget.isNotCheckedColor,
          onChange: (value) => widget.isCheckBox(value),
        ),
        Flexible(
          child: Text(
            widget.titleCheckbox,
            style: widget.titleStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
