import 'package:base_themes/base_color.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_widgets/molecules/personal_info/highest_ranking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/l10n/app_localizations.dart';

class RankInfo extends StatelessWidget {
  const RankInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
      builder: (context, state) {
        return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.backgroundRankingInfo.path),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(SpacingUnit.x3)),
            padding: const EdgeInsets.symmetric(
                horizontal: SpacingUnit.x2_5, vertical: SpacingUnit.x2_5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SpacingUnit.x5, vertical: SpacingUnit.x2_5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(appLocalizations.currentRating,
                        style: theme.textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textTertiary)),
                  ),
                ),
                const SizedBox(height: SpacingUnit.x2_5),
                AppHighestRanking(
                  bgTopRankingImage: Assets.images.backgroundRanking.path,
                  imageRanking: Assets.images.gold.path,
                  isOntop: _rankOnTop(state.currentRank),
                  top: state.currentRank,
                  season: state.season.toString(),
                  contentLabelRankingInfo1: state.totalScore.toString(),
                  contentLabelRankingInfo2: state.playedTime.toString(),
                ),
              ],
            ));
      },
    );
  }
}

bool _rankOnTop(String currentRank) {
  if (currentRank != '') {
    int.parse(currentRank) > 3 ? false : true;
  }
  return false;
}
