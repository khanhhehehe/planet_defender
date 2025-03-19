import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:planet_defender/presentations/bloc/user/user_bloc.dart';
import 'package:planet_defender/presentations/bloc/user/user_state.dart';
import 'package:planet_defender/presentations/pages/personal_info/customize_dialog.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/combat_achievement.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/dialog/content_dialog.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/exp_spaceship.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/rank_info.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/labels/personal_info/uid.dart';
import 'package:base_widgets/molecules/personal_info/item_achievement.dart';
import 'package:base_widgets/molecules/personal_info/level_bar.dart';
import 'package:base_widgets/molecules/personal_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/l10n/app_localizations.dart';

class OverviewInfo extends StatefulWidget {
  const OverviewInfo({super.key});

  @override
  State<OverviewInfo> createState() => _OverviewInfoState();
}

class _OverviewInfoState extends State<OverviewInfo> {
  @override
  void initState() {
    super.initState();
  }

  double _expBar(int exp, int totalExp) {
    return exp / (totalExp == 0 ? 1 : totalExp);
  }

  String _achievement(int index, PersonalInfoState state) {
    if (index == 0) {
      return state.totalGamePlay.toString();
    } else if (index == 1) {
      return state.battle.toString();
    }
    return state.spaceshipOwned.toString();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
          builder: (context, stateInfo) {
            return Column(children: [
              const SizedBox(height: SpacingUnit.x26_5),
              AppLabelUID(
                icon: Assets.images.copy.path,
                onCopy: () {},
                userId: stateInfo.code,
                titleFsel: appLocalizations.fsel,
                accountType: stateInfo.accountType,
              ),
              const SizedBox(height: SpacingUnit.x4),
              UserInfo(
                image: Assets.images.cosmo.path,
                backgroundAvatar: Assets.images.patterns.path,
                userName: state.userInfo.nickName,
                role: state.userInfo.tagName,
                onPress: () => _showCustomizeDialog(context),
              ),
              const SizedBox(height: SpacingUnit.x4),
              AppLevelBar(
                levelFrom: state.userInfo.level.toString(),
                levelTo: (state.userInfo.level + 1).toString(),
                levelPercent: _expBar(stateInfo.exp, stateInfo.totalExp),
              ),
              const SizedBox(height: SpacingUnit.x4),
              const RankInfo(),
              const SizedBox(height: SpacingUnit.x8_5),
              const CombatAchievement(),
              const SizedBox(height: SpacingUnit.x11),
              Padding(
                padding: const EdgeInsets.only(left: SpacingUnit.x7_5),
                child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Thành tựu',
                      style: theme.textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colors.textSecondary),
                    )),
              ),
              const SizedBox(height: SpacingUnit.x2_5),
              Row(
                children: [
                  const Spacer(),
                  ItemAchievement(
                    nameAchievement: 'Số vòng đấu',
                    icon: Assets.images.galaxyIcon.path,
                    score: stateInfo.totalGamePlay.toString(),
                  ),
                  const SizedBox(width: SpacingUnit.x1_5),
                  ItemAchievement(
                    nameAchievement: 'Battle',
                    icon: Assets.images.battleIcon.path,
                    score: stateInfo.totalGamePlay.toString(),
                  ),
                  const SizedBox(width: SpacingUnit.x1_5),
                  ItemAchievement(
                    nameAchievement: 'Spaceship',
                    icon: Assets.images.spaceshipIcon.path,
                    score: stateInfo.totalGamePlay.toString(),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: SpacingUnit.x7),
              const ExpSpaceship(),
              const SizedBox(height: SpacingUnit.x15)
            ]);
          },
        );
      },
    );
  }

  Future<void> _showCustomizeDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomizeDialog(
              title: "Customize",
              backgroundImage: Assets.images.bgCustomizeDialog.path,
              children: const [
                ContentDialog(),
              ]);
        });
  }
}
