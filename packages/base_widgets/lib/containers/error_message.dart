import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.isCurrentPasswordIsWrong,
    required this.pathImageWarning,
    required this.textPasswordIsWrong,
    required this.theme,
    required this.wrongTextFormat,
  });

  final bool isCurrentPasswordIsWrong;
  final String pathImageWarning;
  final String textPasswordIsWrong;
  final ThemeData theme;
  final String wrongTextFormat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SpacingUnit.x6,
          child: isCurrentPasswordIsWrong
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(pathImageWarning)),
                    const SizedBox(
                      width: SpacingUnit.x2,
                    ),
                    Text(
                      textPasswordIsWrong,
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.error,
                          fontSize: SpacingUnit.x3_5,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(pathImageWarning)),
                    const SizedBox(
                      width: SpacingUnit.x2,
                    ),
                    Text(
                      wrongTextFormat,
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.error,
                          fontSize: SpacingUnit.x3_5,
                          fontWeight: FontWeight.w400),
                    ),
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
