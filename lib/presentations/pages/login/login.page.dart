import 'package:base_widgets/molecules/signin_signup/bottom_sign_in.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/login/login_bloc.dart';
import 'package:planet_defender/presentations/bloc/login/login_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/elevated_button.dart';
import 'package:base_widgets/buttons/text_button.dart';
import 'package:base_widgets/inputs/input.dart';
import 'package:base_widgets/inputs/input_password.dart';
import 'package:base_widgets/molecules/signin_signup/forgot_password.dart';
import 'package:base_widgets/molecules/signin_signup/label_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePass = FocusNode();
  bool isShowError = false;

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocConsumer<LoginBloc, LoginState>(
      buildWhen: (previous, current) => current.status != previous.status,
      listener: (context, state) {
        setState(() {
          if (state.status == LoginStatus.loginFailed) {
            isShowError = true;
          } else {
            isShowError = false;
          }
        });
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              color: colors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(SpacingUnit.x2),
              border:
                  Border.all(width: 1, color: colors.outline.withOpacity(0.4))),
          padding: const EdgeInsets.symmetric(
              vertical: SpacingUnit.x6, horizontal: SpacingUnit.x4),
          child: Column(
            children: [
              Visibility(
                  visible: isShowError,
                  child: Column(
                    children: [
                      AppLabelWarning(
                        titleWarning: "Account doesn’t exist",
                        imageIcon: Assets.images.triangleWarning.path,
                        titleStyle: theme.textTheme.labelLarge
                            ?.copyWith(color: colors.error),
                      ),
                      const SizedBox(
                        height: SpacingUnit.x10_5,
                      )
                    ],
                  )),
              AppInput(
                isError: isShowError,
                textHint: 'User account',
                onChange: (String value) {},
                controller: emailController,
                focusNode: focusNodeEmail,
              ),
              const SizedBox(
                height: SpacingUnit.x3,
              ),
              AppInputPassword(
                isError: isShowError,
                textHint: 'Password',
                onChange: (String value) {},
                controller: passwordController,
                focusNode: focusNodePass,
              ),
              const SizedBox(
                height: SpacingUnit.x3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
                child: AppForgotPassword(
                  titleForgotPassword: 'Forgot password ?',
                  titleCreateAccount: 'Create account',
                  onForgotPassword: () => dI<AuthScreensCubit>()
                      .changeStatus(AuthenticationScreensType.forgotPassword),
                  onCreateAccount: () => dI<AuthScreensCubit>()
                      .changeStatus(AuthenticationScreensType.register),
                ),
              ),
              const SizedBox(
                height: SpacingUnit.x6,
              ),
              AppElevatedButton(
                onContinue: () {
                  return login();
                },
                isEnabled: true,
                textButton: 'Login',
              ),
              const SizedBox(
                height: SpacingUnit.x3,
              ),
              AppTextButton(
                onPressed: () {},
                textHint: 'Login as guest',
              ),
              const SizedBox(
                height: SpacingUnit.x4,
              ),
              InkWell(
                onTap: () {},
                child: BottomOtherSignIn(
                  title: 'or continue with',
                  titleStyle: theme.textTheme.labelSmall
                      ?.copyWith(color: colors.textSecondary),
                  buttonImages: [
                    Assets.images.google.path,
                    Assets.images.iconFacebook.path,
                    Assets.images.apple.path
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void login() {
    focusNodeEmail.unfocus();
    focusNodePass.unfocus();
    dI<LoginBloc>().add(RequestLogin(
        username: emailController.text, password: passwordController.text));
  }
}
