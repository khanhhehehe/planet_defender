import 'package:base_themes/base_color.dart';
import 'package:base_widgets/inputs/input.dart';
import 'package:base_widgets/molecules/signin_signup/label_warning.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:common/utils/validate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:planet_defender/presentations/bloc/forgot_password/forgot_password_state.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool validateUsernameStatus = true;
  bool isConfirm = false;
  String username = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        setState(() {
          if (state.status == ForgotPasswordStatus.failed) {
            isConfirm = true;
          } else {
            isConfirm = false;
            dI<AuthScreensCubit>()
                .changeStatus(AuthenticationScreensType.recoverPasswordNew);
          }
        });
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Column(
          children: [
            Visibility(
                visible: isConfirm,
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
              onChange: (value) {
                setState(() {
                  username = value;
                  _usernameValidate(value);
                });
              },
              isError: !validateUsernameStatus,
              textHint: 'Email address / Phone number',
            ),
            const SizedBox(
              height: SpacingUnit.x6,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    validateUsernameStatus ? _confirmForgotPassword() : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors.secondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SpacingUnit.x1))),
                child: Text('Confirm',
                    style: theme.textTheme.bodyLarge?.copyWith(
                        color: validateUsernameStatus
                            ? colors.onSecondary
                            : colors.onSecondaryContainer,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        );
      },
    );
  }

  void _usernameValidate(String value) {
    setState(() {
      if (validatePhoneNumber(value)) {
        validateUsernameStatus = true;
      } else {
        validateUsernameStatus =
            value.isEmpty ? true : validateEmail(value) ?? true;
      }
    });
  }

  void _confirmForgotPassword() {
    dI<ForgotPasswordBloc>().add(RequestForgotPassword(username: username));
  }
}
