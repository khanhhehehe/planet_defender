import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputOTP extends StatefulWidget {
  final bool isError;
  final int boxNumbers;
  final Color? emptyBackgroundColor;
  final Color? notEmptyBackgroundColor;
  final double borderWidth;
  final Color? borderErrorColor;
  final Color? emptyBorderColor;
  final Color? notEmptyBorderColor;
  final Color? textColor;
  final Color? textErrorColor;
  final List<TextEditingController>? otpControllers;
  final double childAspectRatio;
  final ValueChanged<String> getValue;
  const AppInputOTP(
      {super.key,
      this.isError = false,
      this.boxNumbers = 6,
      this.emptyBackgroundColor,
      this.notEmptyBackgroundColor,
      this.borderWidth = 1,
      this.borderErrorColor,
      this.emptyBorderColor,
      this.notEmptyBorderColor,
      this.textColor,
      this.textErrorColor,
      this.childAspectRatio = 0.8,
      this.otpControllers,
      required this.getValue});

  @override
  State<AppInputOTP> createState() => _AppInputOTPState();
}

class _AppInputOTPState extends State<AppInputOTP> {
  List<bool> boxsIsFill = [];
  List<TextEditingController> otpControllers = [];
  List<FocusNode> focusNodes = [];
  List<FocusNode> focusNodes2 = [];
  @override
  void initState() {
    super.initState();
    boxsIsFill = List.generate(widget.boxNumbers, (index) => false);
    otpControllers =
        List.generate(widget.boxNumbers, (index) => TextEditingController());
    focusNodes = List.generate(widget.boxNumbers, (index) => FocusNode());
    focusNodes[0].requestFocus();
    focusNodes2 = List.generate(widget.boxNumbers, (index) => FocusNode());
  }

  void handleBack(int i) {
    if (i > 0) {
      if (otpControllers[i].text.isEmpty) {
        boxsIsFill[i] = false;
        focusNodes[i - 1].requestFocus();
        otpControllers[i - 1].text = '';
        if ((i - 1) == 0) boxsIsFill[0] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return GridView.count(
      crossAxisCount: widget.boxNumbers,
      shrinkWrap: true,
      crossAxisSpacing: 12,
      childAspectRatio: widget.childAspectRatio,
      padding: const EdgeInsets.all(0),
      children: [
        for (int i = 0; i < widget.boxNumbers; i++)
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: boxsIsFill[i]
                    ? (widget.notEmptyBackgroundColor ??
                        theme.colorScheme.surface)
                    : (widget.emptyBackgroundColor ??
                        theme.colorScheme.surface),
                borderRadius:
                    const BorderRadius.all(Radius.circular(SpacingUnit.x1)),
                border: Border.all(
                    width: widget.borderWidth,
                    color: widget.isError
                        ? (widget.borderErrorColor ?? theme.colorScheme.error)
                        : boxsIsFill[i]
                            ? (widget.notEmptyBorderColor ??
                                theme.colorScheme.outline)
                            : (widget.emptyBorderColor ??
                                theme.colorScheme.surface))),
            child: RawKeyboardListener(
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.backspace) {
                  setState(() {
                    handleBack(i);
                  });
                }
              },
              focusNode: focusNodes2[i],
              child: TextField(
                textAlign: TextAlign.center,
                maxLength: 1,
                keyboardType: TextInputType.number,
                controller: otpControllers[i],
                focusNode: focusNodes[i],
                style: theme.textTheme.labelLarge?.copyWith(
                    color: widget.isError
                        ? (widget.textErrorColor ?? theme.colorScheme.error)
                        : (widget.textColor ?? colors.textSecondary)),
                decoration: const InputDecoration(
                  counterText: "",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      boxsIsFill[i] = true;
                      if (i < widget.boxNumbers - 1) {
                        focusNodes[i + 1].requestFocus();
                      } else {
                        focusNodes[i].unfocus();
                      }
                    });
                  } else {
                    setState(() {
                      boxsIsFill[i] = false;
                    });
                  }
                  widget.getValue(_getValueForm(otpControllers));
                },
              ),
            ),
          )
      ],
    );
  }

  String _getValueForm(List<TextEditingController> otpControllers) {
    String otp = '';
    for (var element in otpControllers) {
      otp = otp + element.text;
    }
    if (otp.length < 6) return "";
    return otp;
  }
}
