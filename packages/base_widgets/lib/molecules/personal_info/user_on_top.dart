import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class UserOnTop extends StatelessWidget {
  const UserOnTop({
    super.key,
    required this.bgImageOnTopRanking,
    required this.imageRanking,
    required this.top,
  });

  final String bgImageOnTopRanking;
  final String imageRanking;
  final String top;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Container(
      height: SpacingUnit.x61_5,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(bgImageOnTopRanking))),
      child: Column(children: [
        const SizedBox(height: 24),
        Image.asset(
          imageRanking,
          width: SpacingUnit.x27,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(height: SpacingUnit.x3_25),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => LinearGradient(
                  colors: colors.gradientBlueLight,
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)
              .createShader(bounds),
          child: Text(
            top,
            style: theme.textTheme.labelLarge!.copyWith(
                fontSize: SpacingUnit.x6,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic),
          ),
        ),
      ]),
    );
  }
}
