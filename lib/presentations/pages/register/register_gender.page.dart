import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/register/register_bloc.dart';
import 'package:planet_defender/presentations/bloc/register/register_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/dialogs/alert_dialog.dart';
import 'package:base_widgets/inputs/input_gender.dart';
import 'package:base_widgets/labels/signin_signup/login_now.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterGenderPage extends StatefulWidget {
  const RegisterGenderPage({super.key});

  @override
  State<RegisterGenderPage> createState() => _RegisterGenderPageState();
}

class _RegisterGenderPageState extends State<RegisterGenderPage> {
  @override
  void initState() {
    dI<RegisterBloc>().add(InitRegister());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final theme = Theme.of(context);
    return BlocConsumer<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => current.status != previous.status,
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          dI<AuthScreensCubit>()
              .changeStatus(AuthenticationScreensType.registerSuccessful);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            AppInputGender(
              imageBackgroundDialogPath:
                  Assets.images.backgroundBottomSheet.path,
              getValue: (value) =>
                  dI<RegisterBloc>().add(SetGender(gender: value)),
            ),
            const SizedBox(
              height: SpacingUnit.x6,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  dI<RegisterBloc>().add(OnUpdateRegister());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors.secondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SpacingUnit.x1))),
                child: Text('Next',
                    style: theme.textTheme.bodyLarge?.copyWith(
                        color: colors.onSecondary,
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
        );
      },
    );
  }
}
