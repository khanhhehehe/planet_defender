import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/constants/platform_code.dart';
import 'package:planet_defender/common/constants/role.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/data/models/request/register_request.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/register/register_bloc.dart';
import 'package:planet_defender/presentations/bloc/register/register_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:common/utils/validate_utils.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/dialogs/alert_dialog.dart';
import 'package:base_widgets/inputs/input.dart';
import 'package:base_widgets/inputs/input_password.dart';
import 'package:base_widgets/labels/signin_signup/login_now.dart';
import 'package:base_widgets/molecules/signin_signup/checkbox.dart';
import 'package:base_widgets/molecules/signin_signup/label_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();
  final TextEditingController fullNameCodeController = TextEditingController();

  bool validateEmailStatus = true;
  bool validatePasswordStatus = true;
  bool confirmPasswordStatus = true;
  bool referralCodeStatus = true;
  bool isCheckBox = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) =>
          current.status == RegisterStatus.failed,
      listener: (context, state) {
        setState(() {
          isError = true;
        });
      },
      child: Column(
        children: [
          Visibility(
              visible: isError,
              child: Column(
                children: [
                  AppLabelWarning(
                    titleWarning: "Email address has already registered",
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
            onChange: (value) {},
            controller: fullNameCodeController,
            isError: false,
            textHint: 'FullName',
          ),
          const SizedBox(
            height: SpacingUnit.x3,
          ),
          AppInput(
            onChange: (value) {
              setState(() {
                if (validatePhoneNumber(emailController.text)) {
                  validateEmailStatus = true;
                } else {
                  validateEmailStatus = emailController.text.isEmpty
                      ? true
                      : validateEmail(emailController.text) ?? true;
                }
              });
            },
            controller: emailController,
            isError: !validateEmailStatus,
            textHint: 'Email address / Phone number',
          ),
          const SizedBox(
            height: SpacingUnit.x3,
          ),
          AppInputPassword(
            controller: passwordController,
            isError: !validatePasswordStatus,
            textHint: 'Password',
            showTextBottomInput: !validatePasswordStatus,
            underTextHint:
                '*Your password need at least 8 character (Include 1 capital, 1 number, 1 special character)',
            onChange: (value) {
              setState(() {
                validatePasswordStatus = passwordController.text.isEmpty
                    ? true
                    : appValidatePassword(passwordController.text);
              });
            },
          ),
          const SizedBox(
            height: SpacingUnit.x3,
          ),
          AppInputPassword(
            isError: _isCheckConfirmPassword(),
            controller: confirmPasswordController,
            textHint: 'Confirm password',
            showTextBottomInput: _isCheckConfirmPassword(),
            underTextHint: "*Confirm password doesn't match",
            onChange: (String value) {
              setState(() {
                confirmPasswordStatus = confirmPasswordController.text.isEmpty
                    ? true
                    : appValidatePassword(confirmPasswordController.text);
              });
            },
          ),
          const SizedBox(
            height: SpacingUnit.x3,
          ),
          AppInput(
            controller: referralCodeController,
            isError: false,
            textHint: 'Referral code',
            onChange: (String value) {},
          ),
          const SizedBox(
            height: SpacingUnit.x3,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
              child: AppCheckboxSignup(
                isChecked: isCheckBox,
                isCheckedColor: colors.tonalPalettes.secondary.tp900,
                isNotCheckedColor: colors.tonalPalettes.secondary.tp50,
                titleCheckbox:
                    'Receive news, special offers, player surveys and beta test invites from FSEL.',
                titleStyle: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.tonalPalettes.neutral.tp300),
                isCheckBox: (value) {
                  setState(() {
                    isCheckBox = value;
                  });
                },
              )),
          const SizedBox(
            height: SpacingUnit.x6,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _isEnabledButton() ? register() : null,
              style: ElevatedButton.styleFrom(
                  backgroundColor: colors.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SpacingUnit.x1))),
              child: Text('Register',
                  style: theme.textTheme.bodyLarge?.copyWith(
                      color: _isEnabledButton()
                          ? colors.onSecondary
                          : colors.onSecondaryContainer,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(
            height: SpacingUnit.x8,
          ),
          AppLabelLoginNow(
            onBackLogin: () => showDialog(
                context: context,
                builder: ((context) => AppAlertDialog(
                      closeDialog: () {
                        Navigator.pop(context);
                      },
                      backgroundImage: Assets.images.backgroundDialog.path,
                      countDown: 4,
                      textNotify:
                          'Do you want to stop now and go back to login screen',
                      onContinue: () {
                        dI<AuthScreensCubit>()
                            .changeStatus(AuthenticationScreensType.login);
                        Navigator.pop(context);
                      },
                    ))),
            firstText: 'If you already have an account, ',
            secondText: 'login now',
            thirdText: ' to sign in',
          ),
        ],
      ),
    );
  }

  bool _isCheckConfirmPassword() {
    if (confirmPasswordController.text.isEmpty) {
      return false;
    } else {
      return !confirmPasswordStatus ||
          confirmPasswordController.text != passwordController.text;
    }
  }

  bool _isEnabledButton() {
    return validateEmailStatus &&
        validatePasswordStatus &&
        confirmPasswordStatus &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        isCheckBox;
  }

  void register() {
    if (validatePhoneNumber(emailController.text)) {
      dI<RegisterBloc>().add(RequestRegister(
          request: RegisterRequest(
              role: RoleConst.role,
              fullName: fullNameCodeController.text,
              referralCode: referralCodeController.text,
              password: passwordController.text,
              email: "",
              platformCode: PlatformCodeConst.platformCode,
              numberPhone: emailController.text)));
    } else {
      dI<RegisterBloc>().add(RequestRegister(
          request: RegisterRequest(
              role: RoleConst.role,
              fullName: fullNameCodeController.text,
              referralCode: referralCodeController.text,
              password: passwordController.text,
              email: emailController.text,
              platformCode: PlatformCodeConst.platformCode,
              numberPhone: "")));
    }
  }
}
