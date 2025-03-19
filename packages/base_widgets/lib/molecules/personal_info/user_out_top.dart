import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class UserOutTop extends StatelessWidget {
  const UserOutTop({
    super.key,
    required this.bgImageOutTopRanking,
    required this.top,
  });

  final String bgImageOutTopRanking;
  final String top;

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Container(
      height: SpacingUnit.x61_5,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(bgImageOutTopRanking))),
      child: Column(children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => LinearGradient(
                      colors: colors.gradientBlueLight,
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight)
                  .createShader(bounds),
              child: Text(top,
                  style: const TextStyle(
                    fontSize: SpacingUnit.x6,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                  )),
            ),
          ),
        ),
        const Spacer(
          flex: 3,
        )
      ]),
    );
  }
}
