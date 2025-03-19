import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String textHint;
  final bool isError;
  final TextEditingController? controller;
  final ValueChanged<String> onChange;
  final FocusNode? focusNode;
  const AppInput(
      {super.key,
      this.textHint = 'text hint',
      this.isError = false,
      this.controller,
      required this.onChange,
      this.focusNode});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late String textHint;
  late bool isFocus;

  @override
  void initState() {
    super.initState();
    textHint = widget.textHint;
    isFocus = false;
    widget.focusNode?.addListener(() {
      if (widget.focusNode != null) {
        if (widget.focusNode!.hasFocus) {
          setState(() {
            if (textHint == 'User account') {
              textHint = 'Email address / Phone number';
            } else {
              textHint = widget.textHint;
            }
            isFocus = true;
          });
        } else {
          setState(() {
            textHint = widget.textHint;
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
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(SpacingUnit.x1)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: widget.isError
                ? Border.all(width: 1, color: colors.error)
                : (isFocus
                    ? Border.all(width: 1, color: theme.colorScheme.outline)
                    : null),
            borderRadius:
                const BorderRadius.all(Radius.circular(SpacingUnit.x1)),
            color: colors.shade),
        padding: const EdgeInsets.only(left: SpacingUnit.x4),
        child: TextFormField(
          onChanged: (value) => widget.onChange(value),
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: theme.textTheme.labelLarge?.copyWith(
              color: widget.isError ? colors.error : colors.surfaceContainer,
              fontWeight: FontWeight.w600),
          decoration: InputDecoration(
              labelText: textHint,
              labelStyle: isFocus
                  ? theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color:
                          widget.isError ? colors.error : colors.surfaceBright,
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
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.error),
                      color: colors.error,
                    )
                  : null,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
