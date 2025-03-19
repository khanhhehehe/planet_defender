import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputAppSetting extends StatefulWidget {
  InputAppSetting(
      {super.key,
      this.isHidePassword = true,
      this.labelText = '',
      this.isError = false});

  late bool isHidePassword = true;
  final String labelText;
  bool isFocus = false;
  bool isError = false;

  @override
  State<InputAppSetting> createState() => _InputAppSettingState();
}

class _InputAppSettingState extends State<InputAppSetting> {
  var focusNode = FocusNode();
  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          widget.isFocus = true;
        });
      } else {
        setState(() {
          widget.isFocus = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);

    return Container(
      padding: const EdgeInsets.only(
          top: SpacingUnit.x0_5,
          left: SpacingUnit.x2_5,
          right: SpacingUnit.x2,
          bottom: SpacingUnit.x1),
      height: SpacingUnit.x16_5,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
          color: textFieldIsErrorOrFocus(
              isError: widget.isError,
              isFocus: widget.isFocus,
              colorError: theme.colorScheme.error,
              colorFocus: theme.colorScheme.outline),
        ),
      ),
      child: TextFormField(
        focusNode: focusNode,
        obscureText: widget.isHidePassword,
        decoration: InputDecoration(
          suffixIcon: getSuffixIcon(
            isHidePassword: widget.isHidePassword,
            isError: widget.isError,
            colorError: theme.colorScheme.error,
            colorIcon: theme.colorScheme.outline,
            onTap: () {
              setState(() {
                widget.isHidePassword = !widget.isHidePassword;
              });
            },
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.error),
              borderRadius: BorderRadius.circular(4)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: widget.isError
                  ? theme.colorScheme.error
                  : colors.surfaceContainer,
              fontSize: SpacingUnit.x4,
              fontWeight: FontWeight.w700),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              SpacingUnit.x1,
            ),
          ),
        ),
      ),
    );
  }
}

Color textFieldIsErrorOrFocus(
    {required bool isError,
    required bool isFocus,
    required Color colorError,
    required Color colorFocus}) {
  if (isError) return colorError;
  return isFocus ? colorFocus : Colors.transparent;
}

Widget getSuffixIcon(
    {required bool isHidePassword,
    required bool isError,
    required Color colorError,
    required Color colorIcon,
    required VoidCallback onTap}) {
  if (isError) {
    return Icon(
      Icons.error,
      color: colorError,
    );
  }
  return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Icon(
        isHidePassword ? Icons.visibility_off : Icons.visibility,
        color: colorIcon,
      ));
}
