import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:base_widgets/buttons/title_and_button_app_setting.dart';
import 'package:base_widgets/containers/base_app_setting_screen.dart';
import 'package:base_widgets/dialogs/show_dialog_sing_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:localizations/l10n/app_localizations.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/data/models/enums/character_type.dart';
import 'package:planet_defender/data/models/enums/language_type.dart';
import 'package:planet_defender/data/models/enums/level_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth/auth_bloc.dart';
import 'package:planet_defender/presentations/bloc/auth/auth_state.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/character/character_bloc.dart';
import 'package:planet_defender/presentations/bloc/setting/setting_bloc.dart';
import 'package:planet_defender/presentations/bloc/setting/setting_state.dart';
import 'package:planet_defender/presentations/bloc/user/user_bloc.dart';
import 'package:planet_defender/presentations/bloc/user/user_state.dart';
import 'package:planet_defender/presentations/pages/select_character/level_setting_academic_and_ielts.dart';
import 'package:planet_defender/presentations/pages/setting_screen/setting_configs.dart';
import 'package:planet_defender/presentations/pages/setting_screen/widgets/button_logout.dart';

final settingScreenPage = GoRoute(
    path: Pages.settingScreen,
    builder: (context, GoRouterState state) => const SettingScreen());

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    dI<UserBloc>().add(const GetUserInfo());
    super.initState();
  }

  int countDown = 0;
  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, stateAuth) {
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, stateUser) {
                return BaseAppSettingScreen(
                    textTitle: appLocalizations.setting,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SpacingUnit.x4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: SpacingUnit.x14,
                          ),
                          TitleAndButtonAppSetting(
                            callback: () =>
                                _setLanguage(language: state.language),
                            titleLeft: appLocalizations.settingLanguage,
                            textButton: state.language.name,
                            hasIcon: true,
                          ),
                          const SizedBox(
                            height: SpacingUnit.x4,
                          ),
                          TitleAndButtonAppSetting(
                            callback: () {
                              _selectAcademicLevel(context, appLocalizations);
                            },
                            titleLeft: appLocalizations.academicLevel,
                            textButton: stateUser.userInfo.courseLevel,
                          ),
                          const SizedBox(
                            height: SpacingUnit.x4,
                          ),
                          const SettingConfig(),
                          const SizedBox(
                            height: SpacingUnit.x4,
                          ),
                          TitleAndButtonAppSetting(
                            callback: () {
                              _changePasswordScreen(
                                  context: context, auth: stateAuth.status);
                            },
                            textButton: _isAuthToChangePass(
                                auth: stateAuth.status,
                                appLocalizations: appLocalizations),
                            titleLeft: appLocalizations.accountSettings,
                            titleRight: _isGuest(
                                auth: stateAuth.status,
                                appLocalizations: appLocalizations),
                          ),
                          const SizedBox(
                            height: SpacingUnit.x4,
                          ),
                          CustomSelectButton(
                            callback: () {
                              _deleteData(context: context);
                            },
                            textButton: appLocalizations.deleteData,
                            shadowColor: colors.surfaceContainer,
                            colorText: colors.surfaceContainer,
                            colorGradient: colors.gradientLight,
                          ),
                          const SizedBox(
                            height: SpacingUnit.x8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: SpacingUnit.x10),
                              CustomSelectButton(
                                callback: () {
                                  dI<AppNavigation>().pop(context);
                                },
                                textButton: appLocalizations.back,
                              ),
                              ButtonLogout(
                                hide: stateAuth.status == AuthStatus.loggedIn,
                                onPress: () {
                                  _logout(context: context);
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ));
              },
            );
          },
        );
      },
    );
  }

  Future<void> _logout({required BuildContext context, int time = 0}) {
    final appLocalizations = AppLocalizations.of(context)!;
    return showAlertDialog(
      context: context,
      content: appLocalizations.doYouWantToLogout,
      textButtonLeft: '${appLocalizations.back} ($time)',
      textButtonRight: appLocalizations.logout,
      title: appLocalizations.warning,
      onCancel: () => dI<AppNavigation>().pop(context),
      onContinue: () {
        dI<AuthBloc>().add(const Logout());
        dI<AuthScreensCubit>().changeStatus(AuthenticationScreensType.login);
        dI<AppNavigation>().replace(context, page: Pages.auth);
      },
    );
  }

  Future<void> _deleteData({required BuildContext context, int time = 0}) {
    final appLocalizations = AppLocalizations.of(context)!;
    return showAlertDialog(
      context: context,
      content: appLocalizations.doYouWantDeleteData,
      textButtonLeft: '${appLocalizations.cancel} ($time)',
      textButtonRight: appLocalizations.confirm,
      title: appLocalizations.warning,
      onCancel: () => dI<AppNavigation>().pop(context),
      onContinue: () {},
    );
  }

  Future<dynamic> _selectAcademicLevel(
      BuildContext context, AppLocalizations appLocalizations) {
    final appLocalizations = AppLocalizations.of(context)!;
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return LevelSettingAcademicAndIelts(
            character: CharacterType.zina,
            listContentButtons: const [],
            isEnabledAcademic: true,
            isSelectCosmo: true,
            pathNameCosmo: Assets.images.cosmoScreen.path,
            pathNameZina: Assets.images.zinaScreen.path,
            pathDisabledLeft: Assets.images.buttonDisabledLeft.path,
            pathDisabledRight: Assets.images.buttonDisabledRight.path,
            pathEnabledLeft: Assets.images.buttonEnabledLeft.path,
            pathEnabledRight: Assets.images.buttonEnabledRight.path,
            pathBeveledBox: Assets.images.beveledBox.path,
            titleAcademic: appLocalizations.academic,
            titleButtonStart: appLocalizations.startGame,
            titleIelts: appLocalizations.ielts,
            items: [
              appLocalizations.tooltipAcademic,
              appLocalizations.tooltipIelts
            ],
            onPress: () {
              _setAcademicLevel(context: context);
            },
          );
        });
  }
}

String _isAuthToChangePass(
    {AuthStatus auth = AuthStatus.unauthentication,
    required AppLocalizations appLocalizations}) {
  if (auth == AuthStatus.loggedIn) {
    return appLocalizations.settingChangePass;
  }
  return appLocalizations.linkAccounts;
}

String _isGuest(
    {AuthStatus auth = AuthStatus.unauthentication,
    required AppLocalizations appLocalizations}) {
  if (auth == AuthStatus.loggedIn) {
    return appLocalizations.fsel;
  }
  return appLocalizations.guestAccount;
}

void _setLanguage({LanguageType language = LanguageType.en}) {
  if (language == LanguageType.en) {
    return dI<SettingBloc>().add(const SetLanguage(language: LanguageType.vi));
  }
  return dI<SettingBloc>().add(const SetLanguage(language: LanguageType.en));
}

Future<void> _setAcademicLevel({required BuildContext context, int time = 0}) {
  final appLocalizations = AppLocalizations.of(context)!;
  final userState = dI<CharacterBloc>().state;
  return showAlertDialog(
    context: context,
    content: appLocalizations.doYouWantToChangeAcademicLevel,
    textButtonLeft: '${appLocalizations.cancel} ($time)',
    textButtonRight: appLocalizations.confirm,
    title: appLocalizations.warning,
    onCancel: () => dI<AppNavigation>().pop(context),
    onContinue: () {
      dI<AppNavigation>().pop(context);
      if (userState.academicType != AcademicType.unknown) {
        return dI<UserBloc>()
            .add(SaveAcademicLevel(level: userState.academicType.name));
      }
      dI<UserBloc>().add(SaveAcademicLevel(level: userState.ieltsType.name));
    },
  );
}

void _changePasswordScreen(
    {required BuildContext context,
    AuthStatus auth = AuthStatus.unauthentication}) {
  if (auth == AuthStatus.loggedIn) {
    dI<AppNavigation>().push(context, page: Pages.linkAccount);
  } else {
    dI<AppNavigation>().push(context, page: Pages.linkAccount);
  }
}
