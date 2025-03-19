import 'package:planet_defender/presentations/pages/personal_info/personal_info.page.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/button_rectangle.dart';
import 'package:flutter/material.dart';

class HeaderButtons extends StatefulWidget {
  final String? buttonLeftImage;
  final String? buttonRightImage;
  final String textFirstButton;
  final Color? textFirstColor;
  final Color? textSecondColor;
  final String textSecondButton;
  final FontStyle? fontStyle;
  final String? backgroundImage;
  final VoidCallback onPressOne;
  final VoidCallback onPressTwo;
  final ScreenInfo screen;
  const HeaderButtons(
      {super.key,
      this.buttonLeftImage,
      this.buttonRightImage,
      this.textFirstButton = 'text',
      this.textSecondButton = 'text',
      this.fontStyle,
      this.textFirstColor,
      this.textSecondColor,
      this.backgroundImage,
      required this.onPressOne,
      required this.onPressTwo,
      this.screen = ScreenInfo.infomation});

  @override
  State<HeaderButtons> createState() => _HeaderButtonsState();
}

class _HeaderButtonsState extends State<HeaderButtons> {
  bool onScreenInfomation() {
    return widget.screen == ScreenInfo.infomation ? true : false;
  }

  bool onScreenDiary() {
    return widget.screen == ScreenInfo.diary ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Container(
      padding: const EdgeInsets.only(top: SpacingUnit.x1_5),
      decoration: BoxDecoration(
          image: widget.backgroundImage != null
              ? DecorationImage(image: AssetImage(widget.backgroundImage!))
              : null),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ButtonRectangle(
                imageBackground: widget.buttonLeftImage,
                title: widget.textFirstButton,
                isEnabled: onScreenInfomation() ? true : false,
                fontStyle: widget.fontStyle,
                onPress: () => widget.onPressOne.call(),
                titleColor: (onScreenInfomation()
                        ? widget.textFirstColor
                        : widget.textSecondColor) ??
                    (onScreenInfomation()
                        ? colors.surface
                        : colors.surfaceContainer)),
          ),
          const SizedBox(width: SpacingUnit.x1),
          Expanded(
            child: ButtonRectangle(
                imageBackground: widget.buttonRightImage,
                title: widget.textSecondButton,
                isEnabled: onScreenDiary() ? true : false,
                fontStyle: widget.fontStyle,
                onPress: () => widget.onPressTwo.call(),
                titleColor: (onScreenDiary()
                        ? widget.textFirstColor
                        : widget.textSecondColor) ??
                    (onScreenDiary()
                        ? colors.surface
                        : colors.surfaceContainer)),
          ),
        ],
      ),
    );
  }
}
