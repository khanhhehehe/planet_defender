import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class WarningOrSuccessAndDescription extends StatelessWidget {
  const WarningOrSuccessAndDescription(
      {super.key,
      this.pathImage = '',
      this.description = '',
      this.title = '',
      this.isTitle = false});

  final String pathImage;
  final String description;
  final String title;
  final bool isTitle;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Column(
      children: [
        const SizedBox(
          height: SpacingUnit.x16,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - SpacingUnit.x12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                pathImage,
                height: SpacingUnit.x4,
              ),
              isTitle
                  ? const SizedBox(
                      width: SpacingUnit.x2_5,
                    )
                  : const SizedBox(),
              isTitle
                  ? Text(
                      title,
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: const Color(0xFF2EE5A8),
                          fontSize: SpacingUnit.x3_5,
                          fontWeight: FontWeight.w400),
                    )
                  : const SizedBox()
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: SpacingUnit.x3_5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
          child: Text(
            textAlign: TextAlign.center,
            description,
            style: theme.textTheme.labelLarge?.copyWith(
                color: colors.surfaceContainer,
                fontSize: SpacingUnit.x3_5,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
