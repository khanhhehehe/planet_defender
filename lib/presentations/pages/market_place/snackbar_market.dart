import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planet_defender/gen/assets.gen.dart';

class CustomSnackBar extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPress;
  const CustomSnackBar(
      {super.key, required this.onPress, this.title = '', this.content = ''});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return InkWell(
      onTap: () => onPress.call(),
      child: Container(
        color: colors.background.withOpacity(0.5),
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(SpacingUnit.x4),
              margin: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
              decoration: BoxDecoration(
                  color: colors.surfaceDim,
                  borderRadius: BorderRadius.circular(SpacingUnit.x9),
                  border: Border.all(
                      color: colors.surfaceContainer,
                      width: SpacingUnit.x0_25)),
              child: Row(
                children: [
                  Container(
                    width: SpacingUnit.x20,
                    height: SpacingUnit.x20,
                    padding: const EdgeInsets.all(SpacingUnit.x5),
                    decoration: BoxDecoration(
                        color: colors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(SpacingUnit.x5)),
                    child: SvgPicture.asset(Assets.svg.fselLogo),
                  ),
                  const SizedBox(width: SpacingUnit.x4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              color: colors.onSurface)),
                      Text(content,
                          style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              color: colors.onSurface))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.13,
            )
          ],
        ),
      ),
    );
  }
}
