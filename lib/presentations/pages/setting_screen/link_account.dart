import 'package:common/utils/spacing_unit.dart';
import 'package:base_widgets/containers/base_app_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localizations/l10n/app_localizations.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/presentations/pages/setting_screen/link_account_form.dart';
import 'package:planet_defender/presentations/pages/setting_screen/link_account_select.dart';

final linkAccountPage = GoRoute(
    path: Pages.linkAccount,
    builder: (context, GoRouterState state) => const LinkAccountScreen());

enum ChangePassOrLinkAccount { changePass, linkAccount }

class LinkAccountScreen extends StatefulWidget {
  const LinkAccountScreen({super.key});

  @override
  State<LinkAccountScreen> createState() => _LinkAccountScreenState();
}

class _LinkAccountScreenState extends State<LinkAccountScreen> {
  int time = 0;
  ChangePassOrLinkAccount initScreen = ChangePassOrLinkAccount.changePass;
  void changeSelectAccount() {
    setState(() {
      initScreen = ChangePassOrLinkAccount.linkAccount;
    });
  }

  Widget screen() {
    if (initScreen == ChangePassOrLinkAccount.changePass) {
      return LinkAccountForm(
        time: time,
        onConfirm: changeSelectAccount,
      );
    }
    return LinkAccountSelect(time: time, numAccounts: 0);
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return BaseAppSettingScreen(
      textTitle: appLocalizations.linkAccount,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x6),
          child: screen()),
    );
  }
}
