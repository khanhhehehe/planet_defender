import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:planet_defender/presentations/bloc/user/user_bloc.dart';
import 'package:planet_defender/presentations/bloc/user/user_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/molecules/personal_info/trophy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> trophies = [
  "Số vòng đấu",
  "Điểm cao nhất",
  "Phá hủy",
  "Combo",
  "Z - Matter",
  "Fsel Coin",
];
String _contentTrophies(
    int index, PersonalInfoState stateInfo, UserState stateUser) {
  switch (index) {
    case 0:
      return stateInfo.totalGamePlay.toString();
    case 1:
      return stateUser.userInfo.highestScore.toString();
    case 2:
      return stateInfo.destroyed.toString();
    case 3:
      return stateInfo.combo.toString();
    case 4:
      return stateInfo.zMatter.toString();
    default:
      return stateInfo.fselCoin.toString();
  }
}

class CombatAchievement extends StatelessWidget {
  const CombatAchievement({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
          builder: (context, stateInfo) {
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: SpacingUnit.x8),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Chiến tích',
                        style: theme.textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textSecondary),
                      )),
                ),
                const SizedBox(height: SpacingUnit.x5),
                Padding(
                    padding: const EdgeInsets.only(left: SpacingUnit.x8),
                    child: SizedBox(
                      height: SpacingUnit.x25,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: trophies.length,
                        itemBuilder: (context, index) => Row(
                          children: [
                            TrophyInfo(
                              content:
                                  _contentTrophies(index, stateInfo, state),
                              title: trophies[index],
                            ),
                            const SizedBox(width: SpacingUnit.x1_5)
                          ],
                        ),
                      ),
                    )),
              ],
            );
          },
        );
      },
    );
  }
}
