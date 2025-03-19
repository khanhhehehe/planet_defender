import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitleAndToggleOnOrOff extends StatelessWidget {
  const TitleAndToggleOnOrOff(
      {super.key, this.pathName = '', this.title = '', required this.callback});

  final String title;
  final String pathName;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.labelSmall?.copyWith(
              color: colors.onSurface,
              fontSize: SpacingUnit.x2_75,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: SpacingUnit.x1,
        ),
        GestureDetector(
            onTap: () {
              callback.call();
            },
            child: SvgPicture.asset(pathName))
      ],
    );
  }
}
