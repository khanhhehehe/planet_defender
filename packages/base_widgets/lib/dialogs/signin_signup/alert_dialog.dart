import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final String backgroundImage;
  final String textWarning;
  final String textNotify;
  final String textContinue;
  final String textBack;
  final int countDown;
  final VoidCallback onCancel;
  final VoidCallback onContinue;
  const AppAlertDialog(
      {super.key,
      this.backgroundImage = 'path image',
      this.textWarning = 'Warning',
      this.textNotify = 'text notify',
      this.textContinue = 'Continue',
      this.textBack = 'Go back',
      this.countDown = 1,
      required this.onCancel,
      required this.onContinue});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return SizedBox(
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(SpacingUnit.x2))),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(SpacingUnit.x2),
            child: Image(
              image: AssetImage(backgroundImage),
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Container(
            height: SpacingUnit.x55,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_amber_outlined,
                      color: theme.colorScheme.error,
                    ),
                    const SizedBox(
                      width: SpacingUnit.x2_5,
                    ),
                    Text(
                      textWarning,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.error,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: SpacingUnit.x4_5, horizontal: SpacingUnit.x10),
                  child: Text(
                    textNotify,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelLarge!.copyWith(
                        color: colors.textSecondary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: SpacingUnit.x2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SpacingUnit.x1),
                            boxShadow: [
                              BoxShadow(
                                  color: colors.tertiary.withOpacity(0.25),
                                  blurRadius: SpacingUnit.x2,
                                  offset: const Offset(
                                      0,
                                      SpacingUnit
                                          .x1) // changes position of shadow
                                  ),
                              BoxShadow(
                                  color: colors.tertiary.withOpacity(0.12),
                                  blurRadius: SpacingUnit.x1,
                                  offset: const Offset(
                                      0,
                                      SpacingUnit
                                          .x1) // changes position of shadow
                                  ),
                              BoxShadow(
                                  color: colors.tertiary,
                                  offset: const Offset(
                                      0,
                                      SpacingUnit
                                          .x0_5) // changes position of shadow
                                  )
                            ],
                            gradient: LinearGradient(
                                colors: colors.gradientNavy,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: TextButton(
                          onPressed: () {
                            onContinue.call();
                          },
                          child: Text(
                            '$textContinue ($countDown)',
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: colors.onPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: SpacingUnit.x4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: SpacingUnit.x3),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: SpacingUnit.x2),
                        decoration: BoxDecoration(
                          color: colors.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(SpacingUnit.x1),
                          boxShadow: [
                            BoxShadow(
                                color: theme.colorScheme.secondary
                                    .withOpacity(0.25),
                                blurRadius: SpacingUnit.x2,
                                offset: const Offset(
                                    0,
                                    SpacingUnit
                                        .x1) // changes position of shadow
                                ),
                            BoxShadow(
                                color: theme.colorScheme.secondary
                                    .withOpacity(0.12),
                                blurRadius: SpacingUnit.x1,
                                offset: const Offset(
                                    0,
                                    SpacingUnit
                                        .x1) // changes position of shadow
                                ),
                            BoxShadow(
                                color: theme.colorScheme.secondary,
                                offset: const Offset(
                                    0,
                                    SpacingUnit
                                        .x0_5) // changes position of shadow
                                )
                          ],
                        ),
                        child: TextButton(
                            onPressed: () {
                              onCancel.call();
                            },
                            child: Text(
                              textBack,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  color: theme.colorScheme.secondary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: SpacingUnit.x4),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
