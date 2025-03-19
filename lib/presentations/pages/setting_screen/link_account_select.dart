import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:flutter/material.dart';
import 'package:localizations/l10n/app_localizations.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/pages/setting_screen/widgets/dialog_success.dart';

class LinkAccountSelect extends StatefulWidget {
  final int numAccounts;
  final int time;
  const LinkAccountSelect({super.key, this.numAccounts = 0, this.time = 0});

  @override
  State<LinkAccountSelect> createState() => _LinkAccountSelectState();
}

class _LinkAccountSelectState extends State<LinkAccountSelect> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        const SizedBox(
          height: SpacingUnit.x14,
        ),
        Icon(
          Icons.warning_amber_rounded,
          color: colors.surfaceBright,
          size: SpacingUnit.x5,
        ),
        const SizedBox(height: SpacingUnit.x2_5),
        Text(
          '${appLocalizations.selectAccount1} ${widget.numAccounts.toString()} ${appLocalizations.selectAccount2}',
          textAlign: TextAlign.center,
          style:
              theme.textTheme.labelLarge?.copyWith(color: colors.surfaceBright),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.46,
          child: ListView.separated(
            itemCount: widget.numAccounts,
            separatorBuilder: (context, index) =>
                const SizedBox(height: SpacingUnit.x3),
            itemBuilder: (context, index) {
              return ItemLinkAccount(
                colors: colors,
                theme: theme,
              );
            },
          ),
        ),
        const SizedBox(height: SpacingUnit.x1),
        CustomSelectButton(
          callback: () {
            successful(
              context: context,
              title: appLocalizations.success,
              content: '${appLocalizations.linkAccountSuccess} ${widget.time}s',
              textButton: '${appLocalizations.restart} (${widget.time})',
              onPress: () {
                dI<AppNavigation>().push(context, page: Pages.home);
              },
            );
          },
          colorGradient: colors.gradientNavy,
          textButton: appLocalizations.confirm,
        ),
      ],
    );
  }
}

class ItemLinkAccount extends StatelessWidget {
  final String role;
  final String name;
  final int level;
  final int coin;
  final VoidCallback? onSelect;
  final bool isSelected;
  const ItemLinkAccount({
    super.key,
    required this.colors,
    required this.theme,
    this.role = '',
    this.name = '',
    this.level = 0,
    this.coin = 0,
    this.onSelect,
    this.isSelected = false,
  });

  final BaseThemeColor colors;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return InkWell(
      onTap: () {
        onSelect?.call();
      },
      child: Container(
        height: SpacingUnit.x21,
        padding: const EdgeInsets.symmetric(
            horizontal: SpacingUnit.x4, vertical: SpacingUnit.x2),
        decoration: BoxDecoration(
          color:
              isSelected ? colors.secondary : colors.surfaceContainerBrightest,
          borderRadius: BorderRadius.circular(SpacingUnit.x1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  role,
                  style: theme.textTheme.labelSmall?.copyWith(
                      color: isSelected
                          ? colors.onSecondary
                          : colors.textSecondary),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.labelLarge?.copyWith(
                          color: isSelected
                              ? colors.onSecondary
                              : colors.textTertiary,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${appLocalizations.level} $level",
                      style: theme.textTheme.labelSmall?.copyWith(
                          color: isSelected
                              ? colors.onSecondary
                              : colors.textSecondary,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isSelected
                    ? Image.asset(Assets.images.circleSuccessful.path)
                    : const SizedBox(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(Assets.images.coin.path),
                    Text(
                      coin.toString(),
                      style: theme.textTheme.labelLarge?.copyWith(
                          color: colors.warning, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
