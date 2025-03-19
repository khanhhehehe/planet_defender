import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class OldInput extends StatefulWidget {
  final Color borderColor;
  final Color backgroundColor;
  final double borderWidth;
  final double widthRadius;
  final double marginHorizontal;
  final double paddingBottom;
  final double heightTextInput;
  final String labelText;
  final Color textColor;
  final Color errorTextColor;
  final double textSize;
  final double textPadding;
  final bool isFocus;
  final bool isPassword;

  get getTextSize => textSize;
  const OldInput(
      {super.key,
      this.borderColor = Colors.blue,
      this.backgroundColor = Colors.white,
      this.borderWidth = 2,
      this.widthRadius = 10,
      this.marginHorizontal = 19,
      this.paddingBottom = 10,
      this.heightTextInput = 79,
      this.labelText = 'Text input',
      this.textColor = Colors.white,
      this.errorTextColor = const Color(0xFFFF4593),
      this.textSize = 16,
      this.textPadding = 20,
      this.isFocus = false,
      this.isPassword = false});

  @override
  State<OldInput> createState() => _OldInputState();
}

class _OldInputState extends State<OldInput> {
  TextEditingController textEmail = TextEditingController();
  late FocusNode focusNode;
  late double textHintSize;
  String? errorText;
  bool isError = false;
  bool isHidePassword = false;
  var listBorderIsNotErrorColor = [
    const Color(0xFF5DF5FF),
    const Color(0xFF55D0FF),
    const Color(0xFF4EAEFF),
  ];
  var listBorderIsErrorColor = [
    const Color(0xFFFF4593),
    const Color(0xFFE73885),
    const Color(0xFFE43683),
  ];

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    textHintSize = widget.getTextSize;
    isHidePassword = widget.isPassword;
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          textHintSize = SpacingUnit.x3_5;
        });
      } else {
        setState(() {
          textHintSize = widget.getTextSize;
        });
      }
    });
  }

  @override
  void dispose() {
    textEmail.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:
                  isError ? listBorderIsErrorColor : listBorderIsNotErrorColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(widget.widthRadius))),
      child: Padding(
        padding: EdgeInsets.all(widget.borderWidth),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.widthRadius)),
            color: widget.backgroundColor,
          ),
          padding: EdgeInsets.only(
              left: 20, right: 20, bottom: widget.paddingBottom, top: 10),
          child: TextField(
            focusNode: focusNode,
            obscureText: isHidePassword,
            style: TextStyle(
                color: isError ? widget.errorTextColor : widget.textColor,
                fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: isError ? widget.errorTextColor : widget.textColor,
                fontSize: textHintSize,
              ),
              contentPadding: const EdgeInsets.only(top: SpacingUnit.x2_5),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        isHidePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          isHidePassword = !isHidePassword;
                        });
                      },
                    )
                  : null,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            onChanged: (value) => {
              if (value.isEmpty)
                {
                  setState(
                      () => {errorText = 'Email is empty', isError = true}),
                }
              else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value))
                {
                  setState(() => {
                        errorText = 'Email has incorrect format',
                        isError = true
                      })
                }
              else
                {setState(() => isError = false)}
            },
          ),
        ),
      ),
    );
  }
}
