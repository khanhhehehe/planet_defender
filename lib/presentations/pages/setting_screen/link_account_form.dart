import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:base_widgets/inputs/input.dart';
import 'package:base_widgets/inputs/input_password.dart';
import 'package:base_widgets/molecules/signin_signup/label_warning.dart';
import 'package:flutter/material.dart';
import 'package:localizations/l10n/app_localizations.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/pages/setting_screen/widgets/dialog_success.dart';

class LinkAccountForm extends StatefulWidget {
  final int time;
  final VoidCallback? onConfirm;
  const LinkAccountForm({super.key, this.time = 0, this.onConfirm});

  @override
  State<LinkAccountForm> createState() => _LinkAccountFormState();
}

class _LinkAccountFormState extends State<LinkAccountForm> {
  bool isSuccess = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(children: [
      const SizedBox(
        height: SpacingUnit.x14,
      ),
      Visibility(
          visible: isSuccess,
          child: Column(
            children: [
              AppLabelWarning(
                titleWarning: appLocalizations.accountDoesntExist,
                imageIcon: Assets.images.triangleWarning.path,
                titleStyle:
                    theme.textTheme.labelLarge?.copyWith(color: colors.error),
              ),
              const SizedBox(
                height: SpacingUnit.x10_5,
              )
            ],
          )),
      AppInput(
          onChange: (String value) {},
          controller: email,
          textHint: appLocalizations.loginUsername),
      const SizedBox(height: SpacingUnit.x3),
      AppInputPassword(
        textHint: appLocalizations.currentPassword,
        controller: password,
        onChange: (String value) {},
      ),
      const SizedBox(height: SpacingUnit.x3),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                appLocalizations.forgotTitleForgotPassword,
                style: theme.textTheme.labelSmall?.copyWith(
                    color: colors.textSecondary, fontWeight: FontWeight.w600),
              )),
          TextButton(
              onPressed: () {},
              child: Text(appLocalizations.createAccount,
                  style: theme.textTheme.labelSmall?.copyWith(
                      color: colors.primary, fontWeight: FontWeight.w600))),
        ],
      ),
      SizedBox(
          height:
              MediaQuery.of(context).size.height * (isSuccess ? 0.22 : 0.3)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomSelectButton(
            callback: () {
              successful(
                context: context,
                content:
                    '${appLocalizations.changePassSuccessful} (${widget.time})',
                title: appLocalizations.success,
                textButton: '${appLocalizations.back} (${widget.time})',
                onPress: () {
                  dI<AppNavigation>().pop(context);
                  widget.onConfirm?.call();
                },
              );
            },
            colorGradient: colors.gradientNavy,
            textButton: appLocalizations.link,
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
    ]);
  }
}
