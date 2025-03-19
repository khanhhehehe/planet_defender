import 'dart:async';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/data/models/request/register_request.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/countdown_time/countdown_time_bloc.dart';
import 'package:planet_defender/presentations/bloc/countdown_time/countdown_time_state.dart';
import 'package:planet_defender/presentations/bloc/register/register_bloc.dart';
import 'package:planet_defender/presentations/bloc/register/register_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/dialogs/alert_dialog.dart';
import 'package:base_widgets/inputs/input_otp.dart';
import 'package:base_widgets/labels/resent_otp.dart';
import 'package:base_widgets/labels/signin_signup/login_now.dart';
import 'package:base_widgets/molecules/signin_signup/label_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterOtpPage extends StatefulWidget {
  const RegisterOtpPage({super.key});

  @override
  State<RegisterOtpPage> createState() => _RegisterOtpPageState();
}

class _RegisterOtpPageState extends State<RegisterOtpPage> {
  String otp = '';
  late Timer _timer;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    dI<RegisterBloc>().add(InitRegister());
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      dI<CountdownTimeBloc>().add(const CountTime());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  List<TextEditingController> otpControllers = [];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocConsumer<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => current.status != previous.status,
      listener: (context, state) {
        validateRegisterStatus(state);
      },
      builder: (context, state) {
        return Column(
          children: [
            Visibility(
                visible: isError,
                child: Column(
                  children: [
                    AppLabelWarning(
                      titleWarning: "OTP invalid",
                      imageIcon: Assets.images.triangleWarning.path,
                      titleStyle: theme.textTheme.labelLarge
                          ?.copyWith(color: colors.error),
                    ),
                    const SizedBox(
                      height: SpacingUnit.x10_5,
                    )
                  ],
                )),
            AppInputOTP(
              isError: false,
              getValue: (value) {
                setState(() {
                  otp = value;
                });
              },
            ),
            const SizedBox(
              height: SpacingUnit.x6,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _confirmOtpRegister(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors.secondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SpacingUnit.x1))),
                child: Text('Confirm',
                    style: theme.textTheme.bodyLarge?.copyWith(
                        color: colors.onSecondary,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            ResentOTP(
              registerRequest: state.registerRequest ?? const RegisterRequest(),
            ),
            AppLabelLoginNow(
              onBackLogin: () {
                showDialog(
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
                        )));
              },
              firstText: 'If you already have an account, ',
              secondText: 'login now',
              thirdText: ' to sign in',
            ),
          ],
        );
      },
    );
  }

  void _confirmOtpRegister() {
    dI<RegisterBloc>().add(ConfirmOtpRegister(code: otp));
  }

  void validateRegisterStatus(RegisterState state) {
    setState(() {
      if (state.status == RegisterStatus.failed) {
        isError = true;
      } else {
        isError = false;
        if (state.status == RegisterStatus.success) {
          dI<AuthScreensCubit>()
              .changeStatus(AuthenticationScreensType.registerDateOfBirth);
        }
      }
    });
  }
}

class ResentOTP extends StatelessWidget {
  final RegisterRequest registerRequest;
  const ResentOTP({super.key, required this.registerRequest});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<CountdownTimeBloc, CountdownTimeState>(
      buildWhen: (previous, current) =>
          previous.countTimeStatus != current.countTimeStatus,
      builder: (context, state) {
        return Column(children: [
          const SizedBox(
            height: SpacingUnit.x4,
          ),
          Visibility(
            visible: state.countTimeStatus == StandaloneStatus.fail ||
                state.countTimeStatus == StandaloneStatus.init,
            child: InkWell(
              onTap: () {
                dI<RegisterBloc>()
                    .add(RequestRegister(request: registerRequest));
                dI<CountdownTimeBloc>()
                    .add(const SetExecutionTime(seconds: 180));
              },
              child: Text('Resent OTP',
                  style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      color: colors.tonalPalettes.neutral.tp300)),
            ),
          ),
          if (state.executionTime == null ||
              state.countTimeStatus == StandaloneStatus.start ||
              state.countTimeStatus == StandaloneStatus.success)
            Visibility(
              visible: true,
              child: AppLabelResentOTP(
                time: state.executionTime ?? 0,
              ),
            ),
          const SizedBox(
            height: SpacingUnit.x4,
          ),
        ]);
      },
    );
  }
}
