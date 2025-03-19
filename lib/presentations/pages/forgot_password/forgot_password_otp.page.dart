import 'dart:async';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/countdown_time/countdown_time_bloc.dart';
import 'package:planet_defender/presentations/bloc/countdown_time/countdown_time_state.dart';
import 'package:planet_defender/presentations/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:planet_defender/presentations/bloc/forgot_password/forgot_password_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/inputs/input_otp.dart';
import 'package:base_widgets/labels/resent_otp.dart';
import 'package:base_widgets/molecules/signin_signup/label_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecoverPasswordOtpPage extends StatefulWidget {
  const RecoverPasswordOtpPage({super.key});

  @override
  State<RecoverPasswordOtpPage> createState() => _RecoverPasswordOtpPageState();
}

class _RecoverPasswordOtpPageState extends State<RecoverPasswordOtpPage> {
  String otp = '';
  late Timer _timer;
  bool isError = false;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      dI<CountdownTimeBloc>().add(const CountTime());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _confirmOtp() {
    dI<ForgotPasswordBloc>().add(ConfirmForgotPassword(otp: otp));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) => current.status != previous.status,
      listener: (context, state) {
        if (state.status == ForgotPasswordStatus.failed) {
          setState(() {
            isError = true;
          });
        }
        if (state.status == ForgotPasswordStatus.success) {
          dI<AuthScreensCubit>()
              .changeStatus(AuthenticationScreensType.forgotPasswordSuccessful);
        }
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
                onPressed: () => _confirmOtp(),
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
            const ResentOTP(),
          ],
        );
      },
    );
  }
}

class ResentOTP extends StatelessWidget {
  const ResentOTP({super.key});

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
