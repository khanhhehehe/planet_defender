import 'package:common/utils/validate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planet_defender/presentations/themes/themes.dart';

class AppInput extends StatefulWidget {
  final String placeHolder;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final StringValidator? submitValidator;
  final ValueChanged<String>? onSubmit;
  final VoidCallback? onClickIcon;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onValueSelectChange;
  final TextEditingController? controller;
  final bool required;
  final bool enabled;
  final bool autofocus;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Widget? suffixWidget;
  final Iterable<String>? autofillHints;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final String? error;
  final bool isSubmit;
  final IconData? icon;

  const AppInput(
      {super.key,
      this.placeHolder = "",
      this.textAlign = TextAlign.start,
      this.keyboardType = TextInputType.text,
      this.inputFormatter,
      this.submitValidator,
      this.onSubmit,
      this.controller,
      this.required = false,
      this.enabled = true,
      this.autofocus = false,
      this.maxLength,
      this.suffixWidget,
      this.minLines,
      this.maxLines,
      this.autofillHints,
      this.onSubmitted,
      this.onChange,
      this.focusNode,
      this.error,
      this.isSubmit = false,
      this.icon,
      this.onValueSelectChange,
      this.onClickIcon});

  @override
  State<StatefulWidget> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  FocusNode? _focusNode;

  @override
  void initState() {
    _focusNode = _focusNode ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.getColors(context);
    final theme = Theme.of(context);
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 48,
              child: Focus(
                onFocusChange: (focus) {
                  if (!focus) {
                    setState(() {});
                  }
                },
                child: TextField(
                  onChanged: (value) {
                    widget.onChange?.call(value);
                  },
                  enabled: widget.enabled,
                  inputFormatters: widget.inputFormatter,
                  controller: widget.controller,
                  style: theme.textTheme.bodyMedium,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        bottom: 0,
                        left: 16,
                        top: 0,
                        right: 16 // HERE THE IMPORTANT PART
                        ),
                    suffixIcon: widget.icon != null
                        ? IconButton(
                            onPressed: () {
                              widget.onClickIcon?.call();
                            },
                            icon: Icon(
                              widget.icon,
                              color: colors.textLight,
                            ),
                          )
                        : null,
                    hintText: widget.placeHolder,
                    hintStyle: theme.textTheme.bodyMedium
                        ?.copyWith(color: colors.textLight),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: isEmpty(widget.error)
                            ? colors.textLight
                            : colors.error,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: colors.primary,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              )),
          isEmpty(widget.error)
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    widget.error!,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: colors.error),
                    maxLines: 2,
                  ),
                )
        ]);
  }
}
