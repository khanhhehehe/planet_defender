import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppInputPassword extends StatefulWidget {
  final String textHint;
  final bool isError;
  final String underTextHint;
  final bool showTextBottomInput;
  final ValueChanged<String> onChange;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  const AppInputPassword(
      {super.key,
      this.textHint = 'text hint',
      this.isError = false,
      this.underTextHint = 'Error',
      this.showTextBottomInput = false,
      required this.onChange,
      this.controller,
      this.focusNode});

  @override
  State<AppInputPassword> createState() => _AppInputPasswordState();
}

class _AppInputPasswordState extends State<AppInputPassword> {
  late String textHint;
  late bool isFocus;
  late bool isHidePassword;
  @override
  void initState() {
    super.initState();
    textHint = widget.textHint;
    isFocus = false;
    isHidePassword = true;
    widget.focusNode?.addListener(() {
      if (widget.focusNode != null) {
        if (widget.focusNode!.hasFocus) {
          setState(() {
            isFocus = true;
          });
        } else {
          setState(() {
            isFocus = false;
          });
        }
      }
    });
  }

  bool _isFill() {
    if (widget.controller != null) {
      return widget.controller!.text.isNotEmpty;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(SpacingUnit.x1)),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: widget.isError
                    ? Border.all(width: 1, color: colors.error)
                    : (isFocus
                        ? Border.all(width: 1, color: colors.outline)
                        : null),
                borderRadius: const BorderRadius.all(
                  Radius.circular(SpacingUnit.x1),
                ),
                color: colors.shade),
            padding: const EdgeInsets.only(left: SpacingUnit.x4),
            child: TextFormField(
              controller: widget.controller,
              onChanged: (value) => widget.onChange(value),
              focusNode: widget.focusNode,
              obscureText: isHidePassword,
              style: theme.textTheme.labelLarge?.copyWith(
                  color:
                      widget.isError ? colors.error : colors.surfaceContainer,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                labelText: textHint,
                labelStyle: isFocus
                    ? theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: widget.isError
                            ? colors.error
                            : colors.surfaceBright,
                      )
                    : theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: widget.isError
                            ? colors.error
                            : _isFill()
                                ? colors.surfaceBright
                                : colors.surfaceContainer,
                      ),
                suffixIcon: widget.isError
                    ? (Icon(
                        Icons.error,
                        color: colors.error,
                      ))
                    : (isFocus
                        ? (IconButton(
                            onPressed: () {
                              setState(() {
                                isHidePassword = !isHidePassword;
                              });
                            },
                            icon: Icon(isHidePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            color: widget.isError
                                ? colors.error
                                : theme.colorScheme.outline,
                          ))
                        : null),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.showTextBottomInput,
          child: Column(
            children: [
              const SizedBox(
                height: SpacingUnit.x1,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
                child: Text(
                  widget.underTextHint,
                  style: theme.textTheme.labelSmall!.copyWith(
                      color:
                          widget.isError ? colors.error : colors.textTertiary),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
