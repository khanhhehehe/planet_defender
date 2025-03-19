import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/dialogs/message_dialog.dart';
import 'package:flutter/material.dart';

List<Widget> reviewMeteoriteDetail(
    BuildContext context, GamePlayScreensType type) {
  final colors = BaseThemeColor.of(context);
  return [
    Positioned(
      top: MediaQuery.sizeOf(context).height / 2.1,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 1.5,
        child: Image.asset(
          Assets.images.planetEarth.path,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    Positioned(
      top: MediaQuery.sizeOf(context).height / 2.5,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 1.2,
        child: Image.asset(
          Assets.images.spaceship.path,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    type == GamePlayScreensType.intro8
        ? Container(
            color: colors.background.withOpacity(0.7),
          )
        : const SizedBox(),
    Positioned(
      top: MediaQuery.sizeOf(context).height / 8.1,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 3.65,
        child: Image.asset(
          Assets.images.asteroid1.path,
          fit: BoxFit.fitWidth,
          color: Colors.white,
        ),
      ),
    ),
    Positioned(
      top: MediaQuery.sizeOf(context).height / 7.7,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 4,
        child: Image.asset(
          Assets.images.asteroid1.path,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    if (type == GamePlayScreensType.intro8) ...[
      Positioned(
        top: MediaQuery.sizeOf(context).height / 7.8,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width / 4,
          child: Image.asset(
            Assets.images.sound.path,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.sizeOf(context).height / 9.7,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width / 2.6,
          child: Image.asset(
            Assets.images.highLight.path,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      Positioned(
          top: MediaQuery.sizeOf(context).height / 2.8,
          child: const MessageDialog(title: "Meteorite", isTop: true)),
    ] else ...[
      Container(color: colors.background.withOpacity(0.7)),
      Positioned(
        top: MediaQuery.sizeOf(context).height / 3,
        child: QuestionType(
          type: type,
        ),
      ),
      if (hints[type] != null)
        Positioned(
            left: getMarginQuestionTypeHint(type: type, context: context),
            top: MediaQuery.sizeOf(context).height / 2.1,
            child: MessageDialog(title: hints[type] ?? "", isTop: true)),
    ]
  ];
}

getMarginQuestionTypeHint(
    {required GamePlayScreensType type, required BuildContext context}) {
  switch (type) {
    case GamePlayScreensType.intro10:
      return MediaQuery.sizeOf(context).width / 8;
    case GamePlayScreensType.intro11:
      return MediaQuery.sizeOf(context).width / 3.6;
    case GamePlayScreensType.intro12:
      return MediaQuery.sizeOf(context).width / 2.5;
    case GamePlayScreensType.intro13:
      return MediaQuery.sizeOf(context).width / 2.16;
    case GamePlayScreensType.intro14:
      return MediaQuery.sizeOf(context).width / 1.51;
    default:
      return MediaQuery.sizeOf(context).width;
  }
}

const rows = [1, 1, 1, 1, 1];

class QuestionType extends StatelessWidget {
  final GamePlayScreensType type;
  const QuestionType({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: SpacingUnit.x10, vertical: SpacingUnit.x9),
      width: MediaQuery.sizeOf(context).width / 1.1,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.images.highlight2.path),
              fit: BoxFit.fitWidth)),
      child: Column(children: [
        Row(
          children: [
            ItemQuestion(
              type: type,
              isSelect: type == GamePlayScreensType.intro10,
              flex: rows[0],
              icon: Assets.images.sound.path,
            ),
            ItemQuestion(
              type: type,
              isSelect: type == GamePlayScreensType.intro11,
              flex: rows[1],
              icon: Assets.images.word.path,
            ),
            ItemQuestion(
              type: type,
              isSelect: type == GamePlayScreensType.intro12,
              flex: rows[2],
              icon: Assets.images.image.path,
            ),
            ItemQuestion(
              type: type,
              isSelect: type == GamePlayScreensType.intro13,
              flex: rows[3],
              icon: Assets.images.jumbled.path,
            ),
            ItemQuestion(
              type: type,
              isSelect: type == GamePlayScreensType.intro14,
              flex: rows[4],
              icon: Assets.images.suggestion.path,
            ),
          ],
        ),
      ]),
    );
  }
}

class ItemQuestion extends StatelessWidget {
  final GamePlayScreensType type;
  final bool isSelect;
  final int flex;
  final String icon;

  const ItemQuestion(
      {super.key,
      required this.type,
      required this.isSelect,
      required this.flex,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Opacity(
        opacity: isSelect || type == GamePlayScreensType.intro9 ? 1 : 0.4,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).width / 4,
          child: Image.asset(
            icon,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}

const Map<GamePlayScreensType, String> hints = {
  GamePlayScreensType.intro10: "Media",
  GamePlayScreensType.intro11: "Hint",
  GamePlayScreensType.intro12: "Image",
  GamePlayScreensType.intro13: "Jumbled Spelling",
  GamePlayScreensType.intro14: "Definition",
};
