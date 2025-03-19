import 'dart:async';

import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/constants/meteorite_type.dart';
import 'package:planet_defender/common/constants/z_master_constance.dart';
import 'package:planet_defender/common/utils/meteorite_utils.dart';
import 'package:planet_defender/data/models/enums/fire_status.dart';
import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:planet_defender/data/models/questions_model.dart';
import 'package:planet_defender/domain/entities/meteorite.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_play/fire_bloc/fire_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_play/fire_bloc/fire_state.dart';
import 'package:planet_defender/presentations/bloc/question/question_bloc.dart';
import 'package:planet_defender/presentations/bloc/question/question_state.dart';
import 'dart:math' as math;

class DetailMeteorite extends StatefulWidget {
  final List<Meteorite> listQuestion;
  final FireStatus isFireSuccess;
  final bool introMeteorite;
  final VoidCallback onChangeIntro;
  final bool isEnable;
  final VoidCallback onEnd;
  final bool isIntro;
  final int index;
  final int time;
  final double x;
  final double y;
  final ValueChanged<double> getPosition;
  final VoidCallback onSelect;
  final String? selected;
  final String id;
  final int blood;
  final ValueChanged<double> getX;
  final GameVocabularyType type;
  final VoidCallback? onFireIntro;
  final GamePlayScreensType screenType;
  const DetailMeteorite({
    super.key,
    this.listQuestion = const [],
    required this.type,
    required this.blood,
    required this.id,
    required this.isEnable,
    required this.onEnd,
    required this.isIntro,
    required this.index,
    required this.onChangeIntro,
    required this.time,
    required this.getPosition,
    required this.onSelect,
    this.selected,
    required this.getX,
    required this.x,
    this.isFireSuccess = FireStatus.none,
    required this.introMeteorite,
    required this.y,
    this.onFireIntro,
    required this.screenType,
  });

  @override
  State<DetailMeteorite> createState() => _DetailMeteoriteState();
}

class _DetailMeteoriteState extends State<DetailMeteorite> {
  double currentPosition = 0;
  double nextPosition = 0;
  bool isEnd = false;
  String img = '';
  bool doubleMeteorite = false;
  GameVocabularyType type = GameVocabularyType.none;
  bool checkFireDoubleMeteorite = false;
  bool fireSuccessIntro = false;
  bool isEnableIntro = true;
  double speed = 0;
  double headBarHeight = 0;

  @override
  void initState() {
    setState(() {
      img = _getMeteorite();
      if (widget.listQuestion.isNotEmpty && widget.listQuestion.length > 1) {
        doubleMeteorite = true;
      }
    });
    if (checkFireSuccess()) {
      reset();
    }
    initMeteorite();
    meteoritePosition();
    super.initState();
  }

  Future<void> initMeteorite() async {
    dI<QuestionBloc>()
        .add(SetEnableMeteorite(index: widget.index, isEnable: true));
  }

  animationIntro() {
    if (widget.index == 0) {
      widget.getX(widget.x);
      widget.onSelect.call();
    }
  }

  void meteoritePosition() {
    double maxHeight = widget.y;
    double height = maxHeight / (widget.time * 150);
    setState(() {
      if (nextPosition < maxHeight) {
        if (checkFireSuccess()) {
          nextPosition = currentPosition;
          reset();
          return;
        }
        bool isPause = dI<QuestionBloc>().state.isPause;
        if (isPause == true) {
          nextPosition = nextPosition;
        } else {
          nextPosition = nextPosition +
              height +
              (widget.isIntro ? 8 : speedMeteorio(nextPosition));
        }

        if (widget.id == widget.selected) {
          widget.getPosition(nextPosition);
        }
      } else {
        if (widget.isIntro) {
          if (widget.index == 0) {
            !widget.isIntro ? widget.onChangeIntro.call() : null;
            widget.getPosition(nextPosition);
          }
        } else {
          if (widget.id != ZMasterConstance.id) {
            dI<QuestionBloc>().add(SetBlood(blood: widget.blood));
            isEnd = true;
            final round = dI<QuestionBloc>().state.round;
            if (round < 10) {
              dI<QuestionBloc>().add(SetDefaultAnswer(id: widget.id));
            } else {
              final listId = widget.id.split("_");
              if (listId.isNotEmpty) {
                if (listId.length > 1) {
                  for (var element in listId) {
                    dI<QuestionBloc>().add(SetDefaultAnswer(id: element));
                  }
                }
              }
            }
          }
          reset();
        }
      }
    });
  }

  Future<void> reset() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      dI<FireBloc>().add(const InitFire());
      dI<QuestionBloc>()
          .add(SetEnableMeteorite(index: widget.index, isEnable: false));
      widget.onEnd.call();
      nextPosition = 0;
      currentPosition = 0;
    });
  }

  @override
  void didChangeDependencies() {
    headBarHeight = MediaQuery.sizeOf(context).width / 3.5;
    super.didChangeDependencies();
  }

  double speedMeteorio(double position) {
    return position >= headBarHeight ? 0 : 3;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FireBloc, FireState>(
      listener: (context, state) {
        if (widget.id == widget.selected &&
            widget.isIntro &&
            state.fireStatus == FireStatus.success) {
          reset();
        }
      },
      child: BlocConsumer<QuestionBloc, QuestionState>(
        buildWhen: (previous, current) =>
            previous.listIdDone != current.listIdDone ||
            previous.isPause != current.isPause,
        listenWhen: (previous, current) =>
            previous.listIdDone != current.listIdDone ||
            previous.isPause != current.isPause,
        listener: (context, state) {
          meteoritePosition();
          if (state.id == widget.id && state.round >= 10) {
            final listId = widget.id.split("_");
            bool checkId = state.listIdDone
                .where((element) => element == listId.first)
                .isNotEmpty;
            setState(() {
              checkFireDoubleMeteorite = checkId;
            });
          }
        },
        builder: (context, state) {
          return AnimatedPositioned(
            top: widget.isEnable ? nextPosition / 3 : 0,
            left: widget.x,
            height: SpacingUnit.x18,
            width: SpacingUnit.x18,
            duration: const Duration(microseconds: 1),
            curve: Curves.linear,
            child: !isEnableIntro
                ? const SizedBox()
                : widget.isEnable
                    ? Center(
                        child: checkFireSuccess() ||
                                (fireSuccessIntro &&
                                    widget.isFireSuccess == FireStatus.success)
                            ? Lottie.asset(Assets.json.explosion2)
                            : InkWell(
                                onTap: () {
                                  if (!widget.isIntro) {
                                    widget.getX.call(widget.x);
                                    widget.onSelect.call();
                                  }
                                  if (widget.introMeteorite &&
                                      widget.index == 0) {
                                    widget.getPosition.call(nextPosition / 1.1);
                                    widget.getX(widget.x);
                                    widget.onFireIntro?.call();
                                    Future.delayed(
                                        const Duration(milliseconds: 0), () {
                                      setState(() {
                                        fireSuccessIntro = true;
                                      });
                                    });
                                    Future.delayed(
                                        const Duration(milliseconds: 1500), () {
                                      setState(() {
                                        isEnableIntro = false;
                                        dI<BuffBloc>()
                                            .add(const DeleteAllBuff());
                                        widget.onChangeIntro.call();
                                        widget.onChangeIntro.call();
                                      });
                                    });
                                  }
                                },
                                child: widget.id == ""
                                    ? Positioned(
                                        child: Image.asset(
                                            Assets.images.zMaster.path,
                                            width: SpacingUnit.x40,
                                            height: SpacingUnit.x40,
                                            color: Colors.white,
                                            fit: BoxFit.fitHeight),
                                      )
                                    : Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          if (widget.id == widget.selected)
                                            if (widget.id ==
                                                ZMasterConstance.id) ...[
                                              Positioned(
                                                child: Image.asset(
                                                    Assets.images.zMaster.path,
                                                    width: SpacingUnit.x16_5,
                                                    height: SpacingUnit.x16_5,
                                                    color: Colors.white,
                                                    fit: BoxFit.fitHeight),
                                              ),
                                            ] else ...[
                                              Positioned(
                                                child: Image.asset(img,
                                                    width: SpacingUnit.x36,
                                                    height: SpacingUnit.x36,
                                                    color: Colors.white,
                                                    fit: BoxFit.fitHeight),
                                              ),
                                            ],
                                          if ((widget.introMeteorite &&
                                                  widget.index == 0) ||
                                              widget.screenType ==
                                                  GamePlayScreensType
                                                      .gamePlayCancelFire)
                                            Positioned(
                                              child: Image.asset(
                                                  Assets.images.highLight.path,
                                                  width: SpacingUnit.x23,
                                                  height: SpacingUnit.x23,
                                                  fit: BoxFit.fitHeight),
                                            ),
                                          if (widget.id ==
                                              ZMasterConstance.id) ...[
                                            Positioned(
                                              child: Image.asset(
                                                  Assets.images.zMaster.path,
                                                  width: SpacingUnit.x15,
                                                  height: SpacingUnit.x15,
                                                  fit: BoxFit.contain),
                                            ),
                                          ] else ...[
                                            Positioned(
                                              child: Image.asset(img,
                                                  width: SpacingUnit.x33,
                                                  height: SpacingUnit.x33,
                                                  fit: BoxFit.fitHeight),
                                            ),
                                          ],
                                          if (widget.type !=
                                              GameVocabularyType.none) ...[
                                            if (state.round >= 10 &&
                                                checkFireDoubleMeteorite ==
                                                    false)
                                              Positioned(
                                                right: 30,
                                                child: Image.asset(
                                                    MeteoriteUtils()
                                                        .getGameVocabTypePath(
                                                            widget
                                                                .listQuestion
                                                                .last
                                                                .gameVocabType),
                                                    width: SpacingUnit.x23,
                                                    height: SpacingUnit.x23,
                                                    fit: BoxFit.fitHeight),
                                              ),
                                            Image.asset(
                                                MeteoriteUtils()
                                                    .getGameVocabTypePath(widget
                                                        .listQuestion
                                                        .last
                                                        .gameVocabType),
                                                width: SpacingUnit.x23,
                                                height: SpacingUnit.x23,
                                                fit: BoxFit.fitHeight),
                                          ],
                                          isEnd &&
                                                  widget.id !=
                                                      ZMasterConstance.id
                                              ? Positioned(
                                                  child: Lottie.asset(
                                                      Assets.json.impact))
                                              : const SizedBox()
                                        ],
                                      ),
                              ))
                    : const SizedBox(),
            onEnd: () => {
              meteoritePosition(),
              setState(() {
                currentPosition = nextPosition;
              })
            },
          );
        },
      ),
    );
  }

  bool checkQuestion({required List<String> listIdDone}) {
    final listId = widget.id.split("_");
    bool checkId =
        listIdDone.where((element) => element == listId.first).isEmpty;
    return checkId;
  }

  bool checkFireSuccess() {
    return widget.id == widget.selected &&
        widget.isFireSuccess == FireStatus.success;
  }

  String _getMeteorite() {
    final random = math.Random();
    return listMeteorite[random.nextInt(listMeteorite.length)];
  }
}
