import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer(
      {super.key,
      this.textContent = '',
      required this.callback,
      this.isSelect = false});
  final String textContent;
  final VoidCallback callback;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final colors = BaseThemeColor.of(context);
    return GestureDetector(
      onTap: () {
        callback.call();
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: SpacingUnit.x6, right: SpacingUnit.x4),
        margin: const EdgeInsets.symmetric(
            vertical: SpacingUnit.x1_5, horizontal: SpacingUnit.x6),
        width: MediaQuery.of(context).size.width - SpacingUnit.x12,
        height: SpacingUnit.x10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SpacingUnit.x1),
            border: Border.all(
                color: isSelect ? colors.surfaceDim : Colors.transparent,
                width: 1,
                style: BorderStyle.solid)),
        child: Row(
          children: [
            Text(textContent,
                style: theme.textTheme.labelLarge?.copyWith(
                    color: colors.surfaceDim,
                    fontSize: SpacingUnit.x3_5,
                    fontWeight: FontWeight.w600)),
            const Expanded(child: SizedBox()),
            isSelect
                ? SvgPicture.asset(
                    'packages/base_widgets/assets/check_circle.svg',
                    height: SpacingUnit.x3_5,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
