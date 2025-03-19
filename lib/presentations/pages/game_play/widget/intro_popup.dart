import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:base_themes/base_color.dart';
import 'package:planet_defender/common/constants/content_intro.dart';
import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Intro extends StatefulWidget {
  final GamePlayScreensType type;
  final VoidCallback onTap;
  final bool isShowRobotLeft;
  final bool isShowRobotRight;

  const Intro(
      {Key? key,
      required this.type,
      required this.onTap,
      this.isShowRobotLeft = true,
      this.isShowRobotRight = false})
      : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Stack(
      children: [
        widget.isShowRobotLeft
            ? Positioned(
                bottom: MediaQuery.sizeOf(context).height / 5,
                child: Image.asset(
                  Assets.images.gamePlayRobot.path,
                  width: SpacingUnit.x35,
                  height: SpacingUnit.x49,
                ),
              )
            : const SizedBox(),
        widget.isShowRobotRight
            ? Positioned(
                right: 0,
                bottom: MediaQuery.sizeOf(context).height / 5,
                child: Image.asset(
                  Assets.images.gamePlayRobot.path,
                  width: SpacingUnit.x35,
                  height: SpacingUnit.x49,
                ),
              )
            : const SizedBox(),
        Column(
          children: [
            const Expanded(child: SizedBox()),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      Assets.svg.textDialogue,
                      height: MediaQuery.sizeOf(context).height / 4,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  top: MediaQuery.sizeOf(context).height / 15.5,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: SvgPicture.asset(
                        Assets.svg.textDialogGamePlay,
                        height: MediaQuery.sizeOf(context).height / 6,
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                    top: MediaQuery.sizeOf(context).height / 13,
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height / 7.6,
                      width: MediaQuery.sizeOf(context).width / 1.2,
                      child: AnimatedTextKit(
                        key: ValueKey<String>(contentIntro[widget.type] ?? ''),
                        isRepeatingAnimation: false,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            contentIntro[widget.type] ?? '',
                            textStyle: theme.textTheme.bodySmall!.copyWith(
                                color: widget.type ==
                                        GamePlayScreensType.gamePlaySkill2
                                    ? colors.errorContainer
                                    : colors.textDark,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  bottom: MediaQuery.sizeOf(context).height / 28,
                  right: MediaQuery.sizeOf(context).width / 10,
                  child: GestureDetector(
                    onTap: widget.onTap,
                    child: SizedBox(
                        width: SpacingUnit.x10,
                        height: SpacingUnit.x10,
                        child: SvgPicture.asset(
                          Assets.svg.arrowDown,
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
