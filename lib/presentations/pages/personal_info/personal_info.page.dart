import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/user/user_bloc.dart';
import 'package:planet_defender/presentations/pages/personal_info/history_info.dart';
import 'package:planet_defender/presentations/pages/personal_info/overview_info.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localizations/l10n/app_localizations.dart';

final personalInfoPage = GoRoute(
    path: Pages.personalInfo,
    builder: (context, GoRouterState state) => const PersonalInfoPage());

enum ScreenInfo { infomation, diary }

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  ScreenInfo initScreen = ScreenInfo.infomation;
  late bool isScroll;
  @override
  void initState() {
    isScroll = true;
    dI<UserBloc>().add(const GetUserInfo());
    String studentId = dI<UserBloc>().state.userInfo.studentId;
    dI<PersonalInfoBloc>().add(InitPersonalInfo(studentId: studentId));
    super.initState();
  }

  Widget _getScreen() {
    switch (initScreen) {
      case ScreenInfo.infomation:
        return const OverviewInfo();
      case ScreenInfo.diary:
        return const HistoryInfo();
      default:
        return const OverviewInfo();
    }
  }

  void _setScreen(ScreenInfo screen) {
    setState(() {
      isScroll = (screen == ScreenInfo.infomation);
      initScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
        body: LayoutPersonalInfo(
            scrollActive: isScroll,
            onClose: () {
              Navigator.pop(context);
            },
            screen: initScreen,
            onChangeScreen: _setScreen,
            bgButtonLeftImage: Assets.images.buttonBase.path,
            bgButtonRightImage: Assets.images.buttonBaseSecond.path,
            textFirstButton: appLocalizations.information,
            textSecondButton: appLocalizations.diary,
            backgroundImage: Assets.images.bgHeaderButtons.path,
            child: _getScreen()));
  }
}
