import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/data/models/enums/character_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_state.dart';
import 'package:planet_defender/presentations/bloc/character/character_bloc.dart';
import 'package:planet_defender/presentations/bloc/login/login_bloc.dart';
import 'package:planet_defender/presentations/bloc/register/register_bloc.dart';
import 'package:planet_defender/presentations/bloc/register/register_state.dart';
import 'package:planet_defender/presentations/pages/forgot_password/forgot_password.page.dart';
import 'package:planet_defender/presentations/pages/forgot_password/forgot_password_otp.page.dart';
import 'package:planet_defender/presentations/pages/forgot_password/recover_password_new_page.dart';
import 'package:planet_defender/presentations/pages/login/login.page.dart';
import 'package:planet_defender/presentations/pages/register/register.page.dart';
import 'package:planet_defender/presentations/pages/register/register_date_of_birth.page.dart';
import 'package:planet_defender/presentations/pages/register/register_gender.page.dart';
import 'package:planet_defender/presentations/pages/register/register_otp.page.dart';
import 'package:planet_defender/presentations/pages/successful.page.dart';
import 'package:planet_defender/presentations/themes/base_color.dart';
import 'package:planet_defender/presentations/widgets/dialog_go_home.dart';
import 'package:base_widgets/layout/sign_in.dart';
import 'package:base_widgets/models/screen_auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationScreens extends StatefulWidget {
  const AuthenticationScreens({super.key});

  @override
  State<AuthenticationScreens> createState() => _AuthenticationScreensState();
}

class _AuthenticationScreensState extends State<AuthenticationScreens> {
  void showDialogGoLogin(BuildContext context) {
    showDialog(context: context, builder: ((context) => const DialogGoHome()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthScreensCubit, AuthScreensState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        ScreenAuthModel screen =
            _authPageBuilder(status: state.status, context: context);
        return Scaffold(
            body: LayoutGameFselSignIn(
                onPressed: () => showDialogGoLogin(context),
                titleScreen: screen.titleScreen,
                imageIcon: screen.imageIcon,
                pathImageHeaderName: screen.pathImageHeaderName,
                pathImageBackgroundName: screen.pathImageBackgroundName,
                bottomLoginLayout: screen.bottomLoginLayout,
                titleBottomLayout: screen.titleBottomLayout,
                buttonIcons: screen.buttonIcons,
                child: screen.widget));
      },
    );
  }

  ScreenAuthModel _authPageBuilder(
      {required AuthenticationScreensType status,
      required BuildContext context}) {
    final colors = BaseThemeColor.of(context);
    switch (status) {
      case AuthenticationScreensType.login:
        return ScreenAuthModel(
            titleScreen: 'Login',
            imageIcon: Assets.images.fselLogoWhite.path,
            pathImageHeaderName: Assets.images.backgroundHeaderLogin.path,
            pathImageBackgroundName: Assets.images.backgroundSplashscreen.path,
            bottomLoginLayout: 3,
            titleBottomLayout: 'or continue with',
            buttonIcons: [
              Assets.images.google.path,
              Assets.images.iconFacebook.path,
              Assets.images.iconApple.path
            ],
            widget: const LoginPage());
      case AuthenticationScreensType.register:
        return ScreenAuthModel(
            titleScreen: 'Register',
            imageIcon: Assets.images.fselLogoSecond.path,
            pathImageHeaderName: Assets.images.backgroundHeaderLogin.path,
            pathImageBackgroundName: Assets.images.backgroundLogin.path,
            bottomLoginLayout: 0,
            buttonIcons: [
              Assets.images.google.path,
              Assets.images.iconFacebook.path,
              Assets.images.iconApple.path
            ],
            titleBottomLayout: 'or continue with',
            widget: const RegisterPage());
      case AuthenticationScreensType.registerOtp:
        return ScreenAuthModel(
            titleScreen: 'Register',
            imageIcon: Assets.images.fselLogoSecond.path,
            pathImageHeaderName: Assets.images.backgroundHeaderLogin.path,
            pathImageBackgroundName: Assets.images.backgroundLogin.path,
            bottomLoginLayout: 0,
            titleBottomLayout: 'Back to login',
            buttonIcons: [
              Assets.images.google.path,
              Assets.images.iconFacebook.path,
              Assets.images.iconApple.path
            ],
            widget: const RegisterOtpPage());
      case AuthenticationScreensType.registerDateOfBirth:
        return ScreenAuthModel(
            titleScreen: 'Register',
            imageIcon: Assets.images.fselLogoSecond.path,
            pathImageHeaderName: Assets.images.backgroundHeaderLogin.path,
            pathImageBackgroundName: Assets.images.backgroundLogin.path,
            bottomLoginLayout: 0,
            buttonIcons: [
              Assets.images.google.path,
              Assets.images.iconFacebook.path,
              Assets.images.iconApple.path
            ],
            titleBottomLayout: 'or continue with',
            widget: const RegisterDateOfBirthPage());
      case AuthenticationScreensType.registerGender:
        return ScreenAuthModel(
            titleScreen: 'Register',
            imageIcon: Assets.images.fselLogoSecond.path,
            pathImageHeaderName: Assets.images.backgroundHeaderLogin.path,
            pathImageBackgroundName: Assets.images.backgroundLogin.path,
            bottomLoginLayout: 0,
            buttonIcons: [
              Assets.images.google.path,
              Assets.images.iconFacebook.path,
              Assets.images.iconApple.path
            ],
            titleBottomLayout: 'or continue with',
            widget: const RegisterGenderPage());
      case AuthenticationScreensType.registerSuccessful:
        return ScreenAuthModel(
            titleScreen: 'Register',
            imageIcon: Assets.images.fselLogoSecond.path,
            pathImageHeaderName: Assets.images.backgroundHeaderLogin.path,
            pathImageBackgroundName: Assets.images.backgroundLogin.path,
            bottomLoginLayout: 2,
            widget: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return SuccessfulPage(
                  titleWarning: 'Register successful',
                  content:
                      'You have successfully registered. Click Play now to join our frontline',
                  textHint: 'Play now',
                  onPressed: () {
                    // dI<LoginBloc>().add(RequestLogin(
                    //   username: state.userName,
                    //   password: state.passWord,
                    // ));
                    dI<CharacterBloc>().add(
                        const SetCharacter(character: CharacterType.unknown));
                  },
                  titleColor: colors.success,
                );
              },
            ));
      case AuthenticationScreensType.forgotPassword:
        return ScreenAuthModel(
            titleScreen: 'Recover Password',
            imageIcon: Assets.images.fselLogoSecond.path,
            pathImageHeaderName: Assets.images.backgroundHeaderLogin.path,
            pathImageBackgroundName: Assets.images.backgroundLogin.path,
            bottomLoginLayout: 1,
            titleBottomLayout: 'Back to login',
            buttonIcons: [
              Assets.images.google.path,
              Assets.images.iconFacebook.path,
              Assets.images.iconApple.path
            ],
            widget: const ForgotPasswordPage());
      case AuthenticationScreensType.recoverPasswordNew:
        return ScreenAuthModel(
            titleScreen: 'Recover Password',
            imageIcon: Assets.images.fselLogoSecond.path,
            pathImageHeaderName: Assets.images.backgroundHeaderLogin.path,
            pathImageBackgroundName: Assets.images.backgroundLogin.path,
            buttonIcons: [
              Assets.images.google.path,
              Assets.images.iconFacebook.path,
              Assets.images.iconApple.path
            ],
            bottomLoginLayout: 1,
            titleBottomLayout: 'Back to login',
            widget: const RecoverPasswordNewPage());
      case AuthenticationScreensType.recoverPasswordOtp:
        return ScreenAuthModel(
            titleScreen: 'Recover Password',
            imageIcon: Assets.images.fselLogoSecond.path,
            pathImageHeaderName: Assets.images.backgroundHeaderLogin.path,
            pathImageBackgroundName: Assets.images.backgroundLogin.path,
            bottomLoginLayout: 1,
            titleBottomLayout: 'Back to login',
            widget: const RecoverPasswordOtpPage());
      case AuthenticationScreensType.forgotPasswordSuccessful:
        return ScreenAuthModel(
            titleScreen: 'Recover Password',
            imageIcon: Assets.images.fselLogoSecond.path,
            pathImageHeaderName: Assets.images.backgroundHeaderLogin.path,
            pathImageBackgroundName: Assets.images.backgroundLogin.path,
            bottomLoginLayout: 0,
            widget: SuccessfulPage(
              onPressed: () {
                dI<AuthScreensCubit>()
                    .changeStatus(AuthenticationScreensType.login);
              },
              titleWarning: 'Recover password successful',
              content:
                  'You have successfully recover your password. Click login now to sign in',
              textHint: 'Login now',
            ));
      default:
        return ScreenAuthModel(widget: const SizedBox());
    }
  }
}
