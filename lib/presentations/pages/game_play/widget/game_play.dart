import 'dart:math' as math;

import 'package:base_widgets/dialogs/alert_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/data/models/enums/fire_status.dart';
import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_bloc.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_state.dart';
import 'package:planet_defender/presentations/bloc/game_play/fire_bloc/fire_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_play/fire_bloc/fire_state.dart';
import 'package:planet_defender/presentations/bloc/question/question_bloc.dart';
import 'package:planet_defender/presentations/bloc/question/question_state.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/animation_meteorite.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/z_buff.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/app_bar/app_bar.dart';
import 'package:base_widgets/border/border_select_item_intro.dart';
import 'package:base_widgets/dialogs/message_dialog.dart';
import 'package:base_widgets/hp_bar/hp_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

double position = 0;
double x = 0;

List<Widget> gamePlay({
  required BuildContext context,
  required GamePlayScreensType type,
  required FireStatus fireStatus,
  required VoidCallback onResetFire,
  required bool isShowIntro,
  required VoidCallback useSkill,
  required TextEditingController controller,
  required VoidCallback onFireZMaster,
  required VoidCallback onFireBuff,
  bool isFire = false,
  bool isIntroFistQuest = false,
  required ValueChanged<BulletType> fire,
  required VoidCallback onChangeIntro,
  String pathFreezeBackground = "",
}) {
  final colors = BaseThemeColor.of(context);
  return [
    Positioned(
      bottom: MediaQuery.sizeOf(context).height / 4.4,
      child: Column(
        children: [
          Image.asset(
            height: MediaQuery.sizeOf(context).width / 1.5,
            width: MediaQuery.sizeOf(context).width / 1.5,
            Assets.images.planetEarth.path,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    ),
    RenderMeteorite(
      controller: controller,
      isShowIntro: isShowIntro,
      onChangeIntro: onChangeIntro,
      onFireBuff: onFireBuff,
      onFireZMaster: onFireZMaster,
      type: type,
      focusFirstItem: false,
    ),
    fireStatus == FireStatus.done
        ? BulletWidget(
            onResetFire: onResetFire,
            fireStatus: fireStatus,
            shotSuccessfully: (value) {
              if (type == GamePlayScreensType.gameShowIntroSelectMeteorite ||
                  !isShowIntro ||
                  type == GamePlayScreensType.gamePlayFireButton) {
                dI<FireBloc>().add(const Fire(status: FireStatus.success));
              }
            },
          )
        : const SizedBox(),
    if (type != GamePlayScreensType.gamePlayScoreBoard ||
        type != GamePlayScreensType.gamePlayCurrentRound)
      Positioned(
          top: 0,
          child: BlocBuilder<QuestionBloc, QuestionState>(
            builder: (context, state) {
              return AppBarGamePlay(
                coin: state.coin.toString(),
                score: state.score.toString(),
                round: "Round ${state.round.toString()}",
                introScoreBoard: type == GamePlayScreensType.gamePlayScoreBoard,
                introCurrentRound:
                    type == GamePlayScreensType.gamePlayScoreBoard,
                onPause: () {
                  dI<QuestionBloc>()
                      .add(const ChangePauseStatus(pauseStatus: true));
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: ((context) => AppAlertDialog(
                            closeDialog: () {
                              dI<QuestionBloc>().add(
                                  const ChangePauseStatus(pauseStatus: false));
                              dI<BuffBloc>().add(const DeleteAllBuff());
                              dI<AppNavigation>()
                                  .replace(context, page: Pages.home);
                            },
                            backgroundImage:
                                Assets.images.backgroundDialog.path,
                            countDown: 0,
                            textContinue: "Tiếp tục",
                            textBack: "Rút lui",
                            textNotify:
                                'Bạn có muốn rút lui khỏi cuộc chiến không?',
                            onContinue: () {
                              dI<QuestionBloc>().add(
                                  const ChangePauseStatus(pauseStatus: false));
                              dI<AppNavigation>().pop(context);
                            },
                          )));
                },
              );
            },
          )),
    Positioned(
      bottom: MediaQuery.sizeOf(context).height / 3.3,
      child: Transform.rotate(
        angle: rotateSpacing(context) / 360,
        child: Image.asset(
          height: MediaQuery.sizeOf(context).width / 2,
          width: MediaQuery.sizeOf(context).width / 2,
          Assets.images.spaceship2GamePlay.path,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    (isFire == false && GamePlayScreensType.gamePlay != type ||
                type == GamePlayScreensType.gamePlayScoreBoard ||
                type == GamePlayScreensType.gamePlayStatusBar ||
                type == GamePlayScreensType.gamePlayZMatter ||
                type == GamePlayScreensType.gamePlaySkill ||
                type == GamePlayScreensType.gameButtonSkill ||
                type == GamePlayScreensType.gamePlayCurrentRound ||
                type == GamePlayScreensType.gamePlayHpBar ||
                type == GamePlayScreensType.gamePlayHpBar1 ||
                type == GamePlayScreensType.gameFreeze2 ||
                type == GamePlayScreensType.gamePlayBtnCancelFire) &&
            type != GamePlayScreensType.gameShowIntroSelectMeteorite &&
            type != GamePlayScreensType.gameFreeze &&
            type != GamePlayScreensType.gamePlayIntroFire
        ? Container(
            color: colors.background.withOpacity(0.7),
          )
        : const SizedBox(),
    if (type != GamePlayScreensType.gamePlayStatusBar)
      Positioned(
        bottom: MediaQuery.sizeOf(context).height / 2.25,
        left: MediaQuery.sizeOf(context).width / 1.2,
        child: CustomPaint(
          painter: type == GamePlayScreensType.gamePlayHpBar ||
                  type == GamePlayScreensType.gamePlayHpBar1 ||
                  type == GamePlayScreensType.gameFreeze2
              ? BorderSelectItem()
              : null,
          child: BlocBuilder<QuestionBloc, QuestionState>(
            buildWhen: (previous, current) =>
                previous.blood != current.blood ||
                previous.mana != current.mana ||
                previous.id != current.id,
            builder: (context, state) {
              return HpBar(
                  mana: type == GamePlayScreensType.gameFreeze ||
                          type == GamePlayScreensType.gameFreeze2
                      ? 100
                      : state.mana,
                  hp: state.blood,
                  width: SpacingUnit.x50,
                  height: SpacingUnit.x120,
                  useSkill: () {
                    if (state.id != "") {
                      if (state.mana >= 100) {
                        dI<QuestionBloc>().add(const InitMana());
                        useSkill.call();
                      }
                    }
                  });
            },
          ),
        ),
      ),
    type == GamePlayScreensType.gameFreeze ||
            type == GamePlayScreensType.gameFreeze3
        ? GestureDetector(
            onTap: () => onChangeIntro.call(),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.images.freeze.path))),
            ),
          )
        : const SizedBox(),
    if (type == GamePlayScreensType.gamePlayZMatter) ...[
      Positioned(
        top: MediaQuery.sizeOf(context).height / 4,
        right: MediaQuery.sizeOf(context).width / 1.5,
        child: CustomPaint(
          painter: BorderSelectItem(width: 12),
          child: Container(
            margin: const EdgeInsets.all(SpacingUnit.x2),
            child: Image.asset(
              height: MediaQuery.sizeOf(context).width / 7,
              width: MediaQuery.sizeOf(context).width / 7,
              Assets.images.zMaster.path,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
      Positioned(
          top: MediaQuery.sizeOf(context).height / 2.9,
          right: MediaQuery.sizeOf(context).width / 1.55,
          child: const MessageDialog(
            isTop: true,
            title: "Z matter",
          )),
    ],
    if (type == GamePlayScreensType.gamePlaySkill ||
        type == GamePlayScreensType.gamePlaySkill2) ...[
      Positioned(
        top: MediaQuery.sizeOf(context).height / 5,
        child: Container(
          margin: const EdgeInsets.all(SpacingUnit.x2),
          child: Image.asset(
            width: MediaQuery.sizeOf(context).width / 1.8,
            Assets.images.reviewSkill.path,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.sizeOf(context).height / 4.5,
        child: Container(
          margin: const EdgeInsets.all(SpacingUnit.x2),
          child: Image.asset(
            width: MediaQuery.sizeOf(context).width / 2.6,
            Assets.images.reviewSpaceNuke.path,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      Positioned(
          top: MediaQuery.sizeOf(context).height / 2.1,
          child: Column(
            children: [
              SvgPicture.asset(Assets.svg.chevronDownDuo),
              const Text('Tap the blank space to continue')
            ],
          ))
    ],
    if (type == GamePlayScreensType.gamePlayScoreBoard ||
        type == GamePlayScreensType.gamePlayCurrentRound)
      Positioned(
          top: 0,
          child: AppBarGamePlay(
            introScoreBoard: type == GamePlayScreensType.gamePlayScoreBoard,
            introCurrentRound: type == GamePlayScreensType.gamePlayCurrentRound,
            onPause: () {
              showDialog(
                  context: context,
                  builder: ((context) => SizedBox(
                        child: AppAlertDialog(
                          closeDialog: () {
                            dI<QuestionBloc>().add(
                                const ChangePauseStatus(pauseStatus: false));
                            dI<BuffBloc>().add(const DeleteAllBuff());
                            dI<AppNavigation>()
                                .replace(context, page: Pages.home);
                          },
                          backgroundImage: Assets.images.backgroundDialog.path,
                          countDown: 0,
                          textContinue: "Tiếp tục",
                          textBack: "Rút lui",
                          textNotify:
                              'Bạn có muốn rút lui khỏi cuộc chiến không?',
                          onContinue: () {
                            dI<QuestionBloc>().add(
                                const ChangePauseStatus(pauseStatus: true));
                            Navigator.pop(context);
                          },
                        ),
                      )));
            },
          )),
    if (type == GamePlayScreensType.gamePlayScoreBoard)
      Positioned(
          top: MediaQuery.sizeOf(context).height / 8,
          child: const MessageDialog(
            isTop: true,
            title: "Score board",
          )),
    if (type == GamePlayScreensType.gamePlayCurrentRound)
      Positioned(
          top: MediaQuery.sizeOf(context).height / 10,
          child: const MessageDialog(
            isTop: true,
            title: "Current round",
          )),
    if (type == GamePlayScreensType.gamePlayStatusBar) ...[
      Positioned(
        bottom: MediaQuery.sizeOf(context).height / 2.25,
        left: MediaQuery.sizeOf(context).width / 1.2,
        child: CustomPaint(
          painter: BorderSelectItem(),
          child: HpBar(
            mana: 100,
            hp: 100,
            width: SpacingUnit.x50,
            height: SpacingUnit.x120,
            useSkill: () {},
          ),
        ),
      ),
      Positioned(
          right: MediaQuery.sizeOf(context).width / 5,
          top: MediaQuery.sizeOf(context).height / 2.5,
          child: const MessageDialog(
            isRight: true,
            title: "Status bar",
          )),
    ],
    if (type == GamePlayScreensType.gameFreeze3)
      Positioned(
        bottom: MediaQuery.sizeOf(context).height / 2.25,
        left: MediaQuery.sizeOf(context).width / 1.2,
        child: HpBar(
          mana: 50,
          hp: 100,
          width: SpacingUnit.x50,
          height: SpacingUnit.x120,
          useSkill: () {},
        ),
      ),
    Positioned(
        top: MediaQuery.sizeOf(context).height / 2.2,
        left: 3,
        child: SizedBox(
          width: SpacingUnit.x18_5,
          height: SpacingUnit.x18_5,
          child: type == GamePlayScreensType.gameButtonSkill
              ? Image.asset(Assets.images.highLight.path)
              : null,
        )),
    BlocBuilder<BuffBloc, BuffState>(
      builder: (context, state) {
        return ZBuff(
          listBuff: state.listZBuff,
          type: type,
          onChangeIntro: () => onChangeIntro.call(),
          isShowIntro: isShowIntro,
        );
      },
    ),
    // if (isShowIntro)
    //   RenderMeteorite(
    //     controller: controller,
    //     isShowIntro: isShowIntro,
    //     onChangeIntro: onChangeIntro,
    //     onFireBuff: onFireBuff,
    //     onFireIntro: onFireIntro,
    //     onFireZMaster: onFireZMaster,
    //     type: type,
    //     focusFirstItem: true,
    //   ),
  ];
}

class BulletWidget extends StatefulWidget {
  final VoidCallback onResetFire;
  final ValueChanged<FireStatus> shotSuccessfully;
  final FireStatus fireStatus;
  const BulletWidget(
      {super.key,
      required this.onResetFire,
      required this.fireStatus,
      required this.shotSuccessfully});
  @override
  State<BulletWidget> createState() => _BulletWidgetState();
}

class _BulletWidgetState extends State<BulletWidget> {
  double height = 0;
  FireStatus status = FireStatus.none;

  @override
  void initState() {
    fire();
    super.initState();
  }

  Future<void> fire() async {
    await Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        status = widget.fireStatus;
        height = widget.fireStatus != FireStatus.done
            ? MediaQuery.sizeOf(context).height * 1.3
            : 300;
      });
    });
  }

  double getPosition() {
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: status == FireStatus.done
          ? position / 2.6
          : MediaQuery.sizeOf(context).height / 2,
      left: status == FireStatus.done
          ? (x + SpacingUnit.x8)
          : MediaQuery.sizeOf(context).width / 2.21,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: SpacingUnit.x10,
      child: status == FireStatus.none
          ? const SizedBox()
          : Transform.rotate(
              angle: rotateSpacing(context) / 361,
              child: Image.asset(
                Assets.images.spaceNuke2.path,
                fit: BoxFit.fitWidth,
              ),
            ),
      onEnd: () => {
        widget.onResetFire.call(),
        widget.shotSuccessfully.call(FireStatus.success),
      },
    );
  }
}

double rotateSpacing(BuildContext context) {
  final height = position;
  final width = (MediaQuery.sizeOf(context).width / 2) - (x - 30);
  final c = math.sqrt((height * height) + (width * width));
  final degrees = c * (width / c);
  return 90 - degrees;
}

class RenderMeteorite extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChangeIntro;
  final bool isShowIntro;
  final GamePlayScreensType type;
  final VoidCallback onFireZMaster;
  final VoidCallback onFireBuff;
  final bool focusFirstItem;
  const RenderMeteorite({
    super.key,
    required this.controller,
    required this.onChangeIntro,
    required this.isShowIntro,
    required this.type,
    required this.onFireZMaster,
    required this.onFireBuff,
    required this.focusFirstItem,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FireBloc, FireState>(
      buildWhen: (previous, current) =>
          previous.fireStatus != current.fireStatus,
      builder: (context, state) {
        return BlocBuilder<QuestionBloc, QuestionState>(
          buildWhen: (previous, current) => current.round != previous.round,
          builder: (context, questionState) {
            return MeteoriteWidget(
              controller: controller,
              onChangeIntro: () => onChangeIntro.call(),
              isShowIntro: isShowIntro,
              getPosition: (valuePosition) {
                position = valuePosition;
              },
              isFireSuccess: state.fireStatus,
              getX: (double value) {
                x = value;
              },
              introMeteorite:
                  type == GamePlayScreensType.gameIntroSelectMeteorite ||
                      type == GamePlayScreensType.gameShowIntroSelectMeteorite,
              onFireZMaster: () => onFireZMaster.call(),
              onFireBuff: () => {onFireBuff.call()},
              screenType: type,
              focusFirstItem: focusFirstItem,
            );
          },
        );
      },
    );
  }
}
