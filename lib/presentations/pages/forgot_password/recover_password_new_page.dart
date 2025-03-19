import 'package:base_themes/base_color.dart';
import 'package:base_widgets/inputs/input_password.dart';
import 'package:base_widgets/molecules/signin_signup/label_warning.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:common/utils/validate_utils.dart';
import 'package:flutter/material.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/forgot_password/forgot_password_bloc.dart';

class RecoverPasswordNewPage extends StatefulWidget {
  const RecoverPasswordNewPage({super.key});

  @override
  State<RecoverPasswordNewPage> createState() => _RecoverPasswordNewPageState();
}

class _RecoverPasswordNewPageState extends State<RecoverPasswordNewPage> {
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();
  bool validatePasswordStatus = true;
  bool validateConfirmPasswordStatus = true;
  bool confirmPasswordStatus = true;
  String errorMessages = '';

  void _resetPassword() {
    dI<ForgotPasswordBloc>()
        .add(SetNewPassword(password: confirmPasswordController.text));
    dI<AuthScreensCubit>()
        .changeStatus(AuthenticationScreensType.recoverPasswordOtp);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Column(
      children: [
        Visibility(
            visible: errorMessages.isNotEmpty,
            child: Column(
              children: [
                AppLabelWarning(
                  titleWarning: errorMessages,
                  imageIcon: Assets.images.triangleWarning.path,
                  titleStyle:
                      theme.textTheme.labelLarge?.copyWith(color: colors.error),
                ),
                const SizedBox(
                  height: SpacingUnit.x10_5,
                )
              ],
            )),
        AppInputPassword(
          showTextBottomInput: true,
          controller: newPasswordController,
          isError: !validatePasswordStatus,
          textHint: 'New password',
          underTextHint:
              '*Your password need at least 8 character (Include 1 capital, 1 number, 1 special character)',
          onChange: (value) {
            setState(() {
              validatePasswordStatus = newPasswordController.text.isEmpty
                  ? true
                  : appValidatePassword(newPasswordController.text);
              getValidateNotification();
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
              getValidateNotification();
            });
          },
        ),
        const SizedBox(
          height: SpacingUnit.x6,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _isEnabledButton() ? _resetPassword() : null,
            style: ElevatedButton.styleFrom(
                backgroundColor: colors.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SpacingUnit.x1))),
            child: Text('Reset password',
                style: theme.textTheme.bodyLarge?.copyWith(
                    color: _isEnabledButton()
                        ? colors.onSecondary
                        : colors.onSecondaryContainer,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }

  bool _isCheckConfirmPassword() {
    if (confirmPasswordController.text.isEmpty) {
      return false;
    } else {
      return !confirmPasswordStatus ||
          confirmPasswordController.text != newPasswordController.text;
    }
  }

  bool _isEnabledButton() {
    return validatePasswordStatus &&
        confirmPasswordStatus &&
        newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        !_isCheckConfirmPassword();
  }

  void getValidateNotification() {
    setState(() {
      if (!confirmPasswordStatus && !validatePasswordStatus) {
        errorMessages = "Invalid password";
      }
      if (!confirmPasswordStatus && validatePasswordStatus) {
        errorMessages = "Confirm password incorrect";
      }
      if (confirmPasswordStatus && validatePasswordStatus) {
        if (confirmPasswordController.text != newPasswordController.text) {
          errorMessages = "Confirm password incorrect";
        } else {
          errorMessages = "";
        }
      }
    });
  }

  void onResetPassword() {
    dI<ForgotPasswordBloc>()
        .add(SetNewPassword(password: confirmPasswordController.text));
    dI<AuthScreensCubit>()
        .changeStatus(AuthenticationScreensType.recoverPasswordOtp);
  }
}
