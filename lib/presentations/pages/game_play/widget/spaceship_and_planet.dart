import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/dialogs/message_dialog.dart';
import 'package:flutter/material.dart';

List<Widget> spaceshipAndPlanet(
    {required BuildContext context, required GamePlayScreensType type}) {
  final colors = BaseThemeColor.of(context);
  return [
    _blurBackground(
        value: GamePlayScreensType.intro5 == type ||
            GamePlayScreensType.intro6 == type,
        colors: colors),
    Positioned(
      bottom: MediaQuery.sizeOf(context).height / 2.2,
      child: Column(
        children: [
          Image.asset(
            height: MediaQuery.sizeOf(context).width / 1.5,
            width: MediaQuery.sizeOf(context).width / 1.5,
            Assets.images.planetEarth.path,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    ),
    _blurBackground(value: GamePlayScreensType.intro4 == type, colors: colors),
    GamePlayScreensType.intro5 == type || GamePlayScreensType.intro6 == type
        ? const SizedBox()
        : SpaceshipWidget(
            type: type,
          ),
    if (GamePlayScreensType.intro4 == type ||
        GamePlayScreensType.intro5 == type ||
        GamePlayScreensType.intro6 == type) ...[
      Positioned(
        bottom: type == GamePlayScreensType.intro4
            ? MediaQuery.sizeOf(context).height / 2.3
            : MediaQuery.sizeOf(context).height / 2.5,
        child: Image.asset(
          height: type == GamePlayScreensType.intro4
              ? MediaQuery.sizeOf(context).width / 1.3
              : MediaQuery.sizeOf(context).width / 1.1,
          Assets.images.highLight.path,
          fit: BoxFit.fitHeight,
        ),
      ),
      Positioned(
          top: type == GamePlayScreensType.intro4
              ? MediaQuery.sizeOf(context).height / 6
              : MediaQuery.sizeOf(context).height / 7,
          child: MessageDialog(
            title:
                type == GamePlayScreensType.intro4 ? "Spaceship" : "Planet Z",
          )),
    ],
  ];
}

Widget _blurBackground({required bool value, required BaseThemeColor colors}) {
  return value
      ? Container(
          color: colors.background.withOpacity(0.7),
        )
      : const SizedBox();
}

class SpaceshipWidget extends StatefulWidget {
  final GamePlayScreensType type;
  const SpaceshipWidget({super.key, required this.type});

  @override
  State<SpaceshipWidget> createState() => _SpaceshipWidgetState();
}

class _SpaceshipWidgetState extends State<SpaceshipWidget> {
  bool isShowSpaceship = false;
  @override
  void initState() {
    if (widget.type == GamePlayScreensType.intro1) {
      init();
    }
    super.initState();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        isShowSpaceship = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == GamePlayScreensType.intro1
        ? AnimatedPositioned(
            curve: Curves.linear,
            top: isShowSpaceship
                ? MediaQuery.sizeOf(context).height / 5
                : MediaQuery.sizeOf(context).height,
            duration: const Duration(seconds: 2),
            child: Column(
              children: [
                Image.asset(
                  height: MediaQuery.sizeOf(context).width / 1.3,
                  Assets.images.spaceship.path,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
          )
        : Positioned(
            top: MediaQuery.sizeOf(context).height / 5.5,
            child: Column(
              children: [
                Image.asset(
                  height: MediaQuery.sizeOf(context).width / 1.3,
                  Assets.images.spaceship.path,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
          );
  }
}
