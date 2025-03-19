import 'package:base_widgets/buttons/button_other_sign_in.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class BottomOtherSignIn extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final List<String> buttonImages;
  const BottomOtherSignIn(
      {super.key,
      this.title = 'title',
      this.titleStyle,
      this.buttonImages = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        const SizedBox(
          height: SpacingUnit.x4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (buttonImages.isNotEmpty)
              for (int i = 0; i < buttonImages.length; i++)
                ButtonOtherSignIn(
                  buttonImage: buttonImages[i],
                  onPressed: () {},
                ),
          ],
        ),
      ],
    );
  }
}
