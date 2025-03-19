import 'package:base_themes/base_color.dart';
import 'package:base_widgets/labels/personal_info/ranking_info.dart';
import 'package:base_widgets/molecules/personal_info/user_on_top.dart';
import 'package:base_widgets/molecules/personal_info/user_out_top.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppHighestRanking extends StatelessWidget {
  final bool isOntop;
  final String bgTopRankingImage;
  final String imageRanking;
  final String top;
  final String season;
  final String contentLabelRankingInfo1;
  final String contentLabelRankingInfo2;
  final Color? backgroundColor;
  const AppHighestRanking({
    super.key,
    required this.isOntop,
    required this.bgTopRankingImage,
    required this.imageRanking,
    this.top = '1',
    this.season = '1',
    this.contentLabelRankingInfo1 = 'content1',
    this.contentLabelRankingInfo2 = 'content 2',
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Container(
      height: SpacingUnit.x61_5,
      padding: const EdgeInsets.symmetric(
          horizontal: SpacingUnit.x2_5, vertical: SpacingUnit.x2_5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(SpacingUnit.x3_5)),
        color: backgroundColor,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: isOntop
                  ? UserOnTop(
                      bgImageOnTopRanking: bgTopRankingImage,
                      imageRanking: imageRanking,
                      top: top)
                  : UserOutTop(
                      bgImageOutTopRanking: bgTopRankingImage, top: top)),
          const SizedBox(width: SpacingUnit.x2_5),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Season $season',
                    style: theme.textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colors.textDark,
                        shadows: [
                          textShadow(theme, 0, 1, 1, 0.1),
                          textShadow(theme, 0, 3, 3, 0.09),
                          textShadow(
                              theme, 0, SpacingUnit.x1_5, SpacingUnit.x1, 0.05),
                          textShadow(theme, 0, SpacingUnit.x2_75,
                              SpacingUnit.x1, 0.01),
                          textShadow(theme, 0, SpacingUnit.x4, 5, 0),
                        ]),
                  ),
                  const SizedBox(height: SpacingUnit.x2_5),
                  LabelRankingInfo(
                    title: 'Total score',
                    content: contentLabelRankingInfo1,
                  ),
                  const SizedBox(height: SpacingUnit.x1),
                  LabelRankingInfo(
                    title: 'Play time',
                    content: '$contentLabelRankingInfo2 hours',
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Shadow textShadow(ThemeData theme, double offSetX, double offSetY,
      double blur, double opacity) {
    return Shadow(
      offset: Offset(offSetX, offSetY),
      blurRadius: blur,
      color: theme.colorScheme.secondary.withOpacity(opacity),
    );
  }
}
