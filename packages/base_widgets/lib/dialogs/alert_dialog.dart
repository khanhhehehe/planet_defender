import 'dart:async';

import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppAlertDialog extends StatefulWidget {
  final String backgroundImage;
  final String textWarning;
  final String textNotify;
  final String textContinue;
  final String textBack;
  final int countDown;
  final VoidCallback closeDialog;
  final VoidCallback onContinue;
  const AppAlertDialog({
    super.key,
    this.backgroundImage = 'path image',
    this.textWarning = 'Warning',
    this.textNotify = 'text notify',
    this.textContinue = 'Continue',
    this.textBack = 'Go back',
    this.countDown = 1,
    required this.closeDialog,
    required this.onContinue,
  });

  @override
  State<AppAlertDialog> createState() => _AppAlertDialogState();
}

class _AppAlertDialogState extends State<AppAlertDialog> {
  int countDown = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    setState(() {
      countDown = widget.countDown;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countDown == 0) {
          timer.cancel();
        } else {
          countDown = countDown - 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(SpacingUnit.x2))),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(SpacingUnit.x2),
            child: Image(
              image: AssetImage(widget.backgroundImage),
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height / 5,
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
                      widget.textWarning,
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
                    widget.textNotify,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelLarge!.copyWith(
                        color: colors.textSecondary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: SpacingUnit.x12,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(SpacingUnit.x1),
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
                              if (countDown == 0) {
                                widget.onContinue.call();
                              }
                            },
                            child: Text(
                              countDown == 0
                                  ? widget.textContinue
                                  : '${widget.textContinue} ($countDown)',
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
                                widget.closeDialog.call();
                              },
                              child: Text(
                                widget.textBack,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    color: theme.colorScheme.secondary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: SpacingUnit.x4),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
