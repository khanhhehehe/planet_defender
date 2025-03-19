import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/presentations/pages/activities_game/activities_game.page.dart';
import 'package:planet_defender/presentations/pages/auth.page.dart';
import 'package:planet_defender/presentations/pages/error.page.dart';
import 'package:planet_defender/presentations/pages/final_page.dart';
import 'package:planet_defender/presentations/pages/game_play/game_play.page.dart';
import 'package:planet_defender/presentations/pages/home/home.page.dart';
import 'package:planet_defender/presentations/pages/main.page.dart';
import 'package:planet_defender/presentations/pages/market_place/market_place.page.dart';
import 'package:planet_defender/presentations/pages/personal_info/personal_info.page.dart';
import 'package:planet_defender/presentations/pages/select_character/character.page.dart';
import 'package:planet_defender/presentations/pages/select_character/select_a_character_page.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/presentations/pages/setting_screen/change_password.dart';
import 'package:planet_defender/presentations/pages/setting_screen/link_account.dart';
import 'package:planet_defender/presentations/pages/setting_screen/setting.page.dart';

import 'pages.dart';

@lazySingleton
class AppRouters {
  final GoRouter goRouter;

  AppRouters() : goRouter = _router;

  static GoRouter get _router => GoRouter(
      routes: routerPages,
      navigatorKey: dI<AppNavigation>().navigatorKey,
      initialLocation: '/auth');

  static List<GoRoute> routerPages = {
    Pages.main: mainPageRoute,
    Pages.error: errorPageRoute,
    Pages.home: homePageRoute,
    Pages.auth: authPageRoute,
    Pages.selectCharacter: selectACharacterPageRoute,
    Pages.character: characterPageRoute,
    Pages.gamePlay: gamePlayPageRoute,
    Pages.personalInfo: personalInfoPage,
    Pages.finalGamePlay: finalGamePlayPage,
    Pages.settingScreen: settingScreenPage,
    Pages.changePassword: changePasswordPage,
    Pages.linkAccount: linkAccountPage,
    Pages.activitiesGame: activitiesGame,
    Pages.marketPlace: marketPlacePage,
    // Pages.wikiBook: wikiBookPage
  }.entries.map((entry) => entry.value).toList();
}
