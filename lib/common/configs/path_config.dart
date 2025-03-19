class PathConfig {
  static String login = 'auth-gateway/v1/auth/login';
  static String register = 'auth-gateway/v1/user/sign-up';
  static String forgotPassword = 'auth-gateway/v1/user/forgot-password';
  static String confirmOtpRegister = 'auth-gateway/v1/user/confirm-otp-sign-up';
  static String updateRegister = 'user-gateway/v1/user/update-code-student';
  static String confirmOtpForgotPassword =
      'auth-gateway/v1/user/confirm-otp-reset-password';
  static String chooseLevel =
      'cms-planet-defender-gateway/v1/level-setting/choose-level';
  static String chooseGender =
      'cms-planet-defender-gateway/v1/level-setting/choose-gender';
  static String getUser = 'cms-planet-defender-gateway/v1/cms-planet-defender';
  static String saveGameHistory =
      'cms-planet-defender-gateway/v1/game-history/save-game-history';
  static String getQuestions =
      'cms-planet-defender-gateway/v1/game-play/random-questions';
  static String createNickName =
      'cms-planet-defender-gateway/v1/cms-planet-defender/create-nick-name';
  static String getListGamePlayTimeConfig =
      'cms-planet-defender-gateway/v1/game-play-time-config/get-list-game-play-time-config';
  static String answerTheQuestion =
      'cms-planet-defender-gateway/v1/game-play/answer-the-question';
  static String getStudentDetail =
      'cms-planet-defender-gateway/v1/cms-planet-defender/get-detail-account';
  static String getGameHistory =
      'cms-planet-defender-gateway/v1/game-history/get-game-history';
  static String saveAcademicLevel = 'cms-planet-defender-gateway/v1/level-setting/choose-level';
  static String getEvents = 'cms-planet-defender-gateway/v1/event/get-list-event';
  static String getSpaceships =
      'cms-planet-defender-gateway/v1/space-ship/get-according-to-user';
  static String getCharacters =
      'cms-planet-defender-gateway/v1/character/get-according-to-user';
  static String buySpaceship =
      'cms-planet-defender-gateway/v1/space-ship/buy-space-ship';
  static String buyCharacter =
      '/cms-planet-defender-gateway/v1/character/buy-character';
  static String getZBuff = 'cms-planet-defender-gateway/v1/z-matter/get-according-to-user';
}
