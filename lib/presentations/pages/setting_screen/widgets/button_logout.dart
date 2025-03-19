import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planet_defender/gen/assets.gen.dart';

class ButtonLogout extends StatelessWidget {
  final bool hide;
  final VoidCallback? onPress;
  const ButtonLogout({super.key, this.onPress, this.hide = true});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return hide
        ? GestureDetector(
            onTap: () {
              onPress?.call();
            },
            child: Container(
              alignment: Alignment.center,
              height: SpacingUnit.x10,
              width: SpacingUnit.x10,
              decoration: BoxDecoration(
                  color: colors.shade,
                  borderRadius: BorderRadius.circular(SpacingUnit.x3),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: SpacingUnit.x1,
                        offset: const Offset(0, SpacingUnit.x1),
                        color: colors.secondary)
                  ]),
              child: SvgPicture.asset(Assets.svg.turnOff),
            ),
          )
        : const SizedBox();
  }
}
