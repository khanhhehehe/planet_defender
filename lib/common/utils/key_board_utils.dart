import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';

bool checkShowKeyBoard(GamePlayScreensType type) {
  return type == GamePlayScreensType.gamePlayFireButton ||
      type == GamePlayScreensType.gamePlay ||
      type == GamePlayScreensType.gameIntroSelectMeteorite ||
      type == GamePlayScreensType.gameButtonSkill ||
      type == GamePlayScreensType.gamePlayBtnCancelFire ||
      type == GamePlayScreensType.gameIntroFireSkill ||
      type == GamePlayScreensType.gameFreeze ||
      type == GamePlayScreensType.gameFreeze3 ||
      type == GamePlayScreensType.endIntro;
}

bool checkShowKeyBoardAndIntro(GamePlayScreensType type) {
  return type == GamePlayScreensType.gamePlayIntroMedia ||
      type == GamePlayScreensType.gamePlayIntroFire ||
      type == GamePlayScreensType.gameShowIntroFireSkill ||
      type == GamePlayScreensType.gamePlayCancelFire ||
      type == GamePlayScreensType.gamePlayCancelFire1 ||
      type == GamePlayScreensType.gamePlayHpBar ||
      type == GamePlayScreensType.gamePlayHpBar1 ||
      type == GamePlayScreensType.gameShowIntroSelectMeteorite ||
      type == GamePlayScreensType.gamePlaySkill ||
      type == GamePlayScreensType.gamePlaySkill2 ||
      type == GamePlayScreensType.gameFreeze2;
}
