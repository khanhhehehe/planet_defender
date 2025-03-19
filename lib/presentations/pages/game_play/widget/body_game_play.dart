import 'package:flutter/widgets.dart';
import 'package:planet_defender/data/models/enums/fire_status.dart';
import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/form_input_captain_name.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/game_play.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/review_meteorite.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/review_meteorite_detail.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/spaceship_and_planet.dart';

List<Widget> bodyGamePlay({
  required GamePlayScreensType type,
  required BuildContext context,
  required VoidCallback onTapIntroGamePlay,
  required FireStatus fireStatus,
  required VoidCallback onResetFire,
  required VoidCallback useSkill,
  required TextEditingController controller,
  required VoidCallback onFireZMaster,
  required VoidCallback onFireBuff,
  required bool isIntro,
  VoidCallback? onConfirm,
  bool isFire = false,
}) {
  switch (type) {
    case GamePlayScreensType.intro1:
    case GamePlayScreensType.intro2:
    case GamePlayScreensType.intro3:
    case GamePlayScreensType.intro4:
    case GamePlayScreensType.intro5:
    case GamePlayScreensType.intro6:
      return spaceshipAndPlanet(context: context, type: type);
    case GamePlayScreensType.intro7:
      return reviewMeteorite(context);
    case GamePlayScreensType.intro8:
    case GamePlayScreensType.intro9:
    case GamePlayScreensType.intro10:
    case GamePlayScreensType.intro11:
    case GamePlayScreensType.intro12:
    case GamePlayScreensType.intro13:
    case GamePlayScreensType.intro14:
      return reviewMeteoriteDetail(context, type);
    case GamePlayScreensType.gamePlay:
    case GamePlayScreensType.gamePlayIntroMedia:
    case GamePlayScreensType.gamePlayAnalysisBoard:
    case GamePlayScreensType.gamePlayIntroHint:
    case GamePlayScreensType.gamePlayFireButton:
    case GamePlayScreensType.gamePlayIntroFire:
    case GamePlayScreensType.gamePlayScoreBoard:
    case GamePlayScreensType.gamePlayCurrentRound:
    case GamePlayScreensType.gamePlayStatusBar:
    case GamePlayScreensType.gamePlayZMatter:
    case GamePlayScreensType.gamePlaySkill:
    case GamePlayScreensType.gamePlaySkill2:
    case GamePlayScreensType.gameButtonSkill:
    case GamePlayScreensType.gameIntroSelectMeteorite:
    case GamePlayScreensType.gameShowIntroSelectMeteorite:
    case GamePlayScreensType.gameIntroFireSkill:
    case GamePlayScreensType.gameShowIntroFireSkill:
    case GamePlayScreensType.gamePlayCancelFire:
    case GamePlayScreensType.gamePlayCancelFire1:
    case GamePlayScreensType.gamePlayBtnCancelFire:
    case GamePlayScreensType.gamePlayHpBar:
    case GamePlayScreensType.gamePlayHpBar1:
    case GamePlayScreensType.gamePlayContainer:
    case GamePlayScreensType.gameFreeze:
    case GamePlayScreensType.gameFreeze2:
    case GamePlayScreensType.gameFreeze3:
    case GamePlayScreensType.endIntro:
      return gamePlay(
        isShowIntro: isIntro,
        context: context,
        isFire: isFire,
        type: type,
        onChangeIntro: () => onTapIntroGamePlay.call(),
        fire: (BulletType value) {},
        fireStatus: fireStatus,
        onResetFire: () => onResetFire.call(),
        useSkill: () => useSkill.call(),
        controller: controller,
        onFireZMaster: () => onFireZMaster.call(),
        onFireBuff: () => onFireBuff.call(),
      );
    case (GamePlayScreensType.inputCaptainName):
      return [
        Positioned(
          top: MediaQuery.sizeOf(context).height / 10,
          child: FormInputCaptainName(
            onChange: (String value) {},
            value: '',
            onConfirm: () => onConfirm?.call(),
          ),
        )
      ];
    default:
      return [];
  }
}
