import 'package:base_widgets/layout/splash_screen.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth/auth_bloc.dart';
import 'package:planet_defender/presentations/bloc/auth/auth_state.dart';
import 'package:planet_defender/presentations/bloc/character/character_bloc.dart';
import 'package:planet_defender/presentations/bloc/character/character_state.dart';
import 'package:planet_defender/presentations/pages/authentication_screens.dart';
import 'package:planet_defender/presentations/pages/home/home.page.dart';
import 'package:planet_defender/presentations/pages/select_character/select_a_character_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final authPageRoute = GoRoute(
    path: Pages.auth,
    builder: (context, GoRouterState state) => const AuthPage());

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, characterState) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state.status == AuthStatus.loggedIn) {
              // if (characterState.status == CharacterStatus.success) {
              return LayoutGameFselSplashScreen(
                pathImageBackground: Assets.images.backgroundSplashscreen.path,
                textButton: 'Touch to start',
                pathImageLogo: Assets.images.fselLogoWhite.path,
                isVisible: true,
                pathTextLogo: Assets.images.textSplashScreen.path,
                onPress: () =>
                    dI<AppNavigation>().push(context, page: Pages.home),
              );
              // } else {
              //   return const SelectACharacterPage();
              // }
            }
            return const AuthenticationScreens();
          },
        );
      },
    );
  }
}
