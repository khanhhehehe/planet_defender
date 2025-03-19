import 'dart:async';

import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/countdown_time/countdown_time_bloc.dart';
import 'package:planet_defender/presentations/bloc/countdown_time/countdown_time_state.dart';

Future<void> successful(
    {required BuildContext context,
    String title = '',
    String content = '',
    String textButton = '',
    VoidCallback? onPress}) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return DialogSuccess(
        title: title,
        content: content,
        onPress: () => onPress?.call(),
        textButton: textButton,
      );
    },
  );
}

class DialogSuccess extends StatefulWidget {
  final String title;
  final String content;
  final String textButton;
  final VoidCallback? onPress;

  const DialogSuccess(
      {super.key,
      this.title = '',
      this.content = '',
      this.textButton = '',
      this.onPress});

  @override
  State<DialogSuccess> createState() => _DialogSuccessState();
}

class _DialogSuccessState extends State<DialogSuccess> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      dI<CountdownTimeBloc>().add(const CountTime());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String countDown({int? time}) {
    return time == 0 ? '' : '(${time ?? 0})';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<CountdownTimeBloc, CountdownTimeState>(
      buildWhen: (previous, current) =>
          previous.countTimeStatus != current.countTimeStatus,
      builder: (context, state) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SpacingUnit.x2)),
          backgroundColor: colors.onSurface,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.images.circleSuccessful.path,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.title,
                  style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.success,
                      fontWeight: FontWeight.w600,
                      fontSize: SpacingUnit.x3_5),
                )
              ]),
          content: Text(widget.content,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelLarge?.copyWith(
                  color: colors.textSecondary, fontWeight: FontWeight.w600)),
          actionsPadding: const EdgeInsets.only(bottom: SpacingUnit.x4),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x5),
              child: CustomSelectButton(
                callback: () => widget.onPress?.call(),
                colorGradient: colors.gradientNavy,
                textButton:
                    '${widget.textButton} ${countDown(time: state.executionTime)}',
              ),
            ),
          ],
        );
      },
    );
  }
}
