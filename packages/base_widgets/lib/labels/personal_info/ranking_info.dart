import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';

class LabelRankingInfo extends StatelessWidget {
  final String title;
  final String content;
  const LabelRankingInfo(
      {super.key, this.title = 'title', this.content = 'content'});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.labelSmall!
              .copyWith(color: colors.textTertiary.withOpacity(0.8)),
        ),
        Text(
          content,
          style: theme.textTheme.labelLarge!
              .copyWith(fontWeight: FontWeight.w700, color: colors.textDark),
        )
      ],
    );
  }
}
