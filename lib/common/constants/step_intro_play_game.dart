import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';

Map<GamePlayScreensType, GamePlayScreensType> steps = {
  GamePlayScreensType.none: GamePlayScreensType.intro1,
  GamePlayScreensType.intro1: GamePlayScreensType.inputCaptainName,
  GamePlayScreensType.inputCaptainName: GamePlayScreensType.intro2,
  GamePlayScreensType.intro2: GamePlayScreensType.intro3,
  GamePlayScreensType.intro3: GamePlayScreensType.intro4,
  GamePlayScreensType.intro4: GamePlayScreensType.intro5,
  GamePlayScreensType.intro5: GamePlayScreensType.intro6,
  GamePlayScreensType.intro6: GamePlayScreensType.intro7,
  GamePlayScreensType.intro7: GamePlayScreensType.intro8,
  GamePlayScreensType.intro8: GamePlayScreensType.intro9,
  GamePlayScreensType.intro9: GamePlayScreensType.intro10,
  GamePlayScreensType.intro10: GamePlayScreensType.intro11,
  GamePlayScreensType.intro11: GamePlayScreensType.intro12,
  GamePlayScreensType.intro12: GamePlayScreensType.intro13,
  GamePlayScreensType.intro13: GamePlayScreensType.intro14,
  GamePlayScreensType.intro14: GamePlayScreensType.gamePlay,
  GamePlayScreensType.gamePlay: GamePlayScreensType.gamePlayIntroMedia,
  GamePlayScreensType.gamePlayIntroMedia: GamePlayScreensType.gamePlayIntroHint,
  GamePlayScreensType.gamePlayIntroHint:
      GamePlayScreensType.gamePlayAnalysisBoard,
  GamePlayScreensType.gamePlayAnalysisBoard:
      GamePlayScreensType.gamePlayContainer,
  GamePlayScreensType.gamePlayContainer: GamePlayScreensType.gamePlayFireButton,
  GamePlayScreensType.gamePlayFireButton: GamePlayScreensType.gamePlayIntroFire,
  GamePlayScreensType.gamePlayIntroFire: GamePlayScreensType.gamePlayScoreBoard,
  GamePlayScreensType.gamePlayScoreBoard:
      GamePlayScreensType.gamePlayCurrentRound,
  GamePlayScreensType.gamePlayCurrentRound:
      GamePlayScreensType.gamePlayStatusBar,
  GamePlayScreensType.gamePlayStatusBar: GamePlayScreensType.gamePlayZMatter,
  GamePlayScreensType.gamePlayZMatter: GamePlayScreensType.gamePlaySkill,
  GamePlayScreensType.gamePlaySkill: GamePlayScreensType.gamePlaySkill2,
  GamePlayScreensType.gamePlaySkill2: GamePlayScreensType.gameButtonSkill,
  GamePlayScreensType.gameButtonSkill:
      GamePlayScreensType.gameIntroSelectMeteorite,
  GamePlayScreensType.gameIntroSelectMeteorite:
      GamePlayScreensType.gameShowIntroSelectMeteorite,
  GamePlayScreensType.gameShowIntroSelectMeteorite:
      GamePlayScreensType.gameIntroFireSkill,
  GamePlayScreensType.gameIntroFireSkill:
      GamePlayScreensType.gameShowIntroFireSkill,
  GamePlayScreensType.gameShowIntroFireSkill:
      GamePlayScreensType.gamePlayCancelFire,
  GamePlayScreensType.gamePlayCancelFire:
      GamePlayScreensType.gamePlayCancelFire1,
  GamePlayScreensType.gamePlayCancelFire1:
      GamePlayScreensType.gamePlayBtnCancelFire,
  GamePlayScreensType.gamePlayBtnCancelFire: GamePlayScreensType.gamePlayHpBar,
  GamePlayScreensType.gamePlayHpBar: GamePlayScreensType.gamePlayHpBar1,
  GamePlayScreensType.gamePlayHpBar1: GamePlayScreensType.gameFreeze,
  GamePlayScreensType.gameFreeze: GamePlayScreensType.gameFreeze2,
  GamePlayScreensType.gameFreeze2: GamePlayScreensType.gameFreeze3,
  GamePlayScreensType.gameFreeze3: GamePlayScreensType.endIntro,
};
