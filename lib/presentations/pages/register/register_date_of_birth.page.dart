import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/register/register_bloc.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/dialogs/alert_dialog.dart';
import 'package:base_widgets/inputs/input_datepicker.dart';
import 'package:base_widgets/labels/signin_signup/login_now.dart';
import 'package:flutter/material.dart';

class RegisterDateOfBirthPage extends StatelessWidget {
  const RegisterDateOfBirthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final theme = Theme.of(context);
    return Column(
      children: [
        AppInputDatePicker(
          getValue: (String value) {
            dI<RegisterBloc>().add(SetDateOfBirth(date: value));
          },
        ),
        const SizedBox(
          height: SpacingUnit.x6,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              dI<AuthScreensCubit>()
                  .changeStatus(AuthenticationScreensType.registerGender);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: colors.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SpacingUnit.x1))),
            child: Text('Next',
                style: theme.textTheme.bodyLarge?.copyWith(
                    color: colors.onSecondary, fontWeight: FontWeight.w600)),
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
    );
  }
}
