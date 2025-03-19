import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:base_widgets/dialogs/alert_dialog.dart';
import 'package:flutter/material.dart';

class DialogGoHome extends StatelessWidget {
  const DialogGoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      closeDialog: () {
        Navigator.pop(context);
      },
      backgroundImage: Assets.images.backgroundDialog.path,
      countDown: 4,
      textNotify: 'Do you want to stop now and go back to login screen',
      onContinue: () {
        dI<AuthScreensCubit>().changeStatus(AuthenticationScreensType.login);
        Navigator.pop(context);
      },
    );
  }
}
