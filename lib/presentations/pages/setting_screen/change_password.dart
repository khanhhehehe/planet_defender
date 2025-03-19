import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:base_widgets/containers/base_app_setting_screen.dart';
import 'package:base_widgets/inputs/input_password.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localizations/l10n/app_localizations.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/presentations/pages/setting_screen/widgets/dialog_success.dart';

final changePasswordPage = GoRoute(
    path: Pages.changePassword,
    builder: (context, GoRouterState state) => const ChangePasswordScreen());

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  int time = 0;
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    return BaseAppSettingScreen(
      textTitle: appLocalizations.changePassword,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x6),
        child: Column(children: [
          const SizedBox(
            height: SpacingUnit.x14,
          ),
          AppInputPassword(
            textHint: appLocalizations.currentPassword,
            controller: currentPassword,
            onChange: (String value) {},
          ),
          const SizedBox(height: SpacingUnit.x3),
          AppInputPassword(
            textHint: appLocalizations.newPassword,
            controller: newPassword,
            onChange: (String value) {},
            underTextHint: appLocalizations.passwordCodition,
            showTextBottomInput: true,
          ),
          const SizedBox(height: SpacingUnit.x3),
          AppInputPassword(
            textHint: appLocalizations.confirmPassword,
            controller: confirmPassword,
            onChange: (String value) {},
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSelectButton(
                callback: () {
                  successful(
                    context: context,
                    content: '${appLocalizations.changePassSuccessful} ($time)',
                    title: appLocalizations.success,
                    textButton: '${appLocalizations.back} ($time)',
                    onPress: () => dI<AppNavigation>().pop(context),
                  );
                },
                colorGradient: colors.gradientNavy,
                textButton: appLocalizations.confirm,
              ),
              CustomSelectButton(
                callback: () {
                  dI<AppNavigation>().pop(context);
                },
                colorGradient: colors.gradientLight,
                textButton: appLocalizations.cancel,
                colorText: colors.surfaceContainer,
                shadowColor: colors.surfaceContainer,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
