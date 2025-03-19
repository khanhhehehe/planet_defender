import 'package:planet_defender/presentations/pages/personal_info/personal_info.page.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/header_buttons.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/header_tab_bar_final_page.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:base_widgets/buttons/button_close.dart';

class LayoutPersonalInfo extends StatefulWidget {
  final bool isFinalPage;
  final bool isShowActionButton;
  final Widget child;
  final bool scrollActive;
  final VoidCallback onClose;
  final String? bgButtonLeftImage;
  final String? bgButtonRightImage;
  final String? backgroundImage;
  final String textFirstButton;
  final String textSecondButton;
  final ScreenInfo screen;
  final void Function(ScreenInfo) onChangeScreen;

  const LayoutPersonalInfo(
      {super.key,
      required this.child,
      this.isShowActionButton = true,
      this.scrollActive = true,
      required this.onClose,
      this.bgButtonLeftImage,
      this.bgButtonRightImage,
      this.backgroundImage,
      this.textFirstButton = 'title',
      this.textSecondButton = 'title',
      this.screen = ScreenInfo.infomation,
      required this.onChangeScreen,
      this.isFinalPage = false});

  @override
  State<LayoutPersonalInfo> createState() => _LayoutPersonalInfoState();
}

class _LayoutPersonalInfoState extends State<LayoutPersonalInfo> {
  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Container(
      color: colors.surfaceContainerLowest,
      height: MediaQuery.of(context).size.height,
      child: Stack(children: [
        widget.scrollActive
            ? SingleChildScrollView(
                child: widget.child,
              )
            : widget.child,
        Column(children: [
          Container(
              color: colors.surfaceContainerLowest, height: SpacingUnit.x11),
          Container(
            color: colors.surfaceContainerLowest,
            padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
            child: widget.isFinalPage
                ? const HeaderTabBarFinalPage()
                : HeaderButtons(
                    onPressOne: () =>
                        widget.onChangeScreen(ScreenInfo.infomation),
                    onPressTwo: () => widget.onChangeScreen(ScreenInfo.diary),
                    textFirstButton: widget.textFirstButton,
                    textSecondButton: widget.textSecondButton,
                    buttonLeftImage: widget.bgButtonLeftImage,
                    buttonRightImage: widget.bgButtonRightImage,
                    backgroundImage: widget.backgroundImage,
                    fontStyle: FontStyle.italic,
                    screen: widget.screen,
                    textFirstColor: colors.onPrimary,
                    textSecondColor: colors.surfaceContainer),
          )
        ]),
        if (widget.isShowActionButton)
          Positioned(
              bottom: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height * 0.92),
              right: SpacingUnit.x11,
              child: ButtonClose(
                child: Icon(Icons.close, color: colors.textSecondary),
                onPress: () => widget.onClose.call(),
              )),
      ]),
    );
  }
}
