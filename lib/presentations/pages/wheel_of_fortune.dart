import 'dart:async';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/utils/buff_utils.dart';
import 'package:planet_defender/data/models/enums/z_buff_types.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_bloc.dart';
import 'package:planet_defender/presentations/bloc/question/question_bloc.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';

class WheelOfFortune extends StatefulWidget {
  const WheelOfFortune({super.key});
  @override
  State<WheelOfFortune> createState() => _WheelOfFortuneState();
}

class _WheelOfFortuneState extends State<WheelOfFortune> {
  final _controller = FixedExtentScrollController(initialItem: 10);

  Timer? upperSliderTimer;
  int counter = 10;
  int currentTime = 10;
  int count = 100;
  bool isSpin = false;
  bool checkSpin = false;
  ZBuffType zBuffType = ZBuffType.unknown;

  void startController() async {
    setState(() {
      checkSpin = true;
    });
    if (counter > 0) {
      upperSliderTimer =
          Timer.periodic(const Duration(milliseconds: 200), (timer) {
        _controller.animateToItem(counter,
            duration: const Duration(milliseconds: 70),
            curve: Curves.easeInCubic);
        setState(() {
          counter++;
          currentTime = currentTime + 100;
          count = count + 100;
        });
        if (currentTime > 4000) {
          setState(() {
            counter = 10;
          });
          showBuff();
        }
      });
    }
  }

  Future<void> showBuff() async {
    await Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        isSpin = true;
        if (zBuffType == ZBuffType.unknown) {
          zBuffType = BuffUtils().randomBuff();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final maxWidth = MediaQuery.sizeOf(context).width;
    final maxHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(Assets.images.wheelOfFortuneBg.path),
        Positioned(
          bottom: maxHeight / 1.35,
          child: Image.asset(
            Assets.images.logoFsel2.path,
            color: colors.secondary,
            width: maxWidth / 2.3,
          ),
        ),
        Positioned(
          bottom: maxHeight / 1.6,
          child: Image.asset(
            Assets.images.titleWheelOfFortune.path,
            width: maxWidth / 2.2,
          ),
        ),
        Positioned(
          child: Image.asset(
            Assets.images.wheelOfFortuneFormBg.path,
            width: maxWidth,
          ),
        ),
        Positioned(
          child: Image.asset(
            Assets.images.wheelOfFortuneSelectItem.path,
            width: maxWidth / 4.2,
          ),
        ),
        Positioned(
          child: ListItemFortune(
            count: count,
            controller: _controller,
          ),
        ),
        if (checkSpin == false)
          Positioned(
            bottom: maxHeight / 4,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width / 3,
              child: AppElevatedButton(
                onContinue: () {
                  return startController();
                },
                isEnabled: true,
                textButton: 'SPIN',
              ),
            ),
          ),
        if (isSpin == true) ...[
          Container(
            color: colors.background.withOpacity(0.97),
          ),
          Positioned(
            child: Image.asset(
              Assets.images.borderFortune.path,
              width: maxWidth / 2,
            ),
          ),
          Positioned(
            child: Image.asset(
              zBuffType.pathImage,
              width: maxWidth / 4,
            ),
          ),
          Positioned(
            top: maxHeight / 1.6,
            child: GestureDetector(
              onTap: () {
                dI<BuffBloc>().add(AddBuff(type: zBuffType));
                dI<QuestionBloc>().add(CheckIsSpin());
                dI<QuestionBloc>().add(const GetTimeConfig());
                dI<QuestionBloc>().add(const ChangeRound());
                dI<QuestionBloc>().add(SetMaxHeight(
                    maxHeight: MediaQuery.sizeOf(context).height / 0.75));
              },
              child: Image.asset(
                Assets.images.fortuneContinue.path,
                width: maxWidth / 2,
              ),
            ),
          ),
        ]
      ],
    ));
  }
}

class ListItemFortune extends StatefulWidget {
  final FixedExtentScrollController controller;
  final int count;
  const ListItemFortune({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  State<ListItemFortune> createState() => _ListItemFortuneState();
}

class _ListItemFortuneState extends State<ListItemFortune> {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;
    return RotatedBox(
      quarterTurns: 3,
      child: ListWheelScrollView.useDelegate(
          controller: widget.controller,
          itemExtent: maxWidth / 3.5,
          childDelegate: ListWheelChildBuilderDelegate(
              childCount: widget.count,
              builder: (BuildContext context, int index) {
                return RotatedBox(
                  quarterTurns: 1,
                  child: Image.asset(
                    Assets.images.wheelOfFortuneItem.path,
                    width: maxWidth / 3.5,
                  ),
                );
              })),
    );
  }
}
