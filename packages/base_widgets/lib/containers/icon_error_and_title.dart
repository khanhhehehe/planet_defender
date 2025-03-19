import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class IconErrorAndTitle extends StatelessWidget {
  const IconErrorAndTitle({
    super.key,
    this.pathImageError = '',
    this.textError = '',
  });

  final String textError;
  final String pathImageError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const SizedBox(
          height: SpacingUnit.x5,
        ),
        SizedBox(
          height: SpacingUnit.x6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                pathImageError,
                height: SpacingUnit.x4,
              ),
              const SizedBox(
                width: SpacingUnit.x2_5,
              ),
              Text(
                textError,
                style: theme.textTheme.labelLarge?.copyWith(
                    fontSize: SpacingUnit.x3_5,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.error),
              )
            ],
          ),
        ),
        const SizedBox(
          height: SpacingUnit.x8,
        ),
      ],
    );
  }
}
