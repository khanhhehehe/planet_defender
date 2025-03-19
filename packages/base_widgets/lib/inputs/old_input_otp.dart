import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class OldInputOTP extends StatefulWidget {
  const OldInputOTP({super.key});

  @override
  State<OldInputOTP> createState() => _OldInputOTPState();
}

class _OldInputOTPState extends State<OldInputOTP> {
  bool isFill = false;
  @override
  void initState() {
    super.initState();
    isFill = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFA5D4FF)),
          borderRadius: const BorderRadius.all(Radius.circular(SpacingUnit.x2)),
          boxShadow: isFill
              ? const [
                  BoxShadow(color: Color(0xFF4BBEFF)),
                  BoxShadow(
                    color: Color(0xFF1A2C58),
                    spreadRadius: -0.5,
                    blurRadius: SpacingUnit.x1,
                  )
                ]
              : []),
      child: TextField(
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        autofocus: true,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFFA5D4FF)),
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
        onChanged: (value) => {
          if (value.isNotEmpty)
            {
              setState(
                  () => {isFill = true, FocusScope.of(context).nextFocus()})
            }
          else
            {setState(() => isFill = false)}
        },
      ),
    );
  }
}
