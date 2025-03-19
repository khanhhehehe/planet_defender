import 'dart:async';

import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/constants/z_master_constance.dart';
import 'package:planet_defender/common/utils/meteorite_utils.dart';
import 'package:planet_defender/data/models/enums/fire_status.dart';
import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:planet_defender/data/models/enums/z_buff_types.dart';
import 'package:planet_defender/data/models/questions_model.dart';
import 'package:planet_defender/domain/entities/meteorite.dart';
import 'package:planet_defender/domain/entities/meteorite_detail.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_bloc.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_state.dart';
import 'package:planet_defender/presentations/bloc/game_play/fire_bloc/fire_bloc.dart';
import 'package:planet_defender/presentations/bloc/key_board/keyboard_bloc.dart';
import 'package:planet_defender/presentations/bloc/question/question_bloc.dart';
import 'package:planet_defender/presentations/bloc/question/question_state.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/detail_meteorite.dart';

class MeteoriteWidget extends StatefulWidget {
  final VoidCallback onFireZMaster;
  final VoidCallback onFireBuff;
  final bool isShowIntro;
  final VoidCallback onChangeIntro;
  final ValueChanged<double> getPosition;
  final ValueChanged<double> getX;
  final FireStatus isFireSuccess;
  final bool introMeteorite;
  final TextEditingController controller;
  final GamePlayScreensType screenType;
  final bool focusFirstItem;
  const MeteoriteWidget(
      {Key? key,
      required this.onFireZMaster,
      required this.onFireBuff,
      required this.isShowIntro,
      required this.onChangeIntro,
      required this.getPosition,
      required this.getX,
      required this.isFireSuccess,
      required this.introMeteorite,
      required this.controller,
      required this.screenType,
      required this.focusFirstItem})
      : super(key: key);

  @override
  State<MeteoriteWidget> createState() => _MeteoriteWidgetState();
}

class _MeteoriteWidgetState extends State<MeteoriteWidget> {
  int meteoriteDelay = 3;
  int? select;
  int? isFireDone;
  FireStatus isFireSuccess = FireStatus.none;
  int currentIndex = 0;
  int totalQuestions = 0;
  bool isEnableZMaster = false;
  double zMasterX = 0;

  @override
  void initState() {
    _initState();
    super.initState();
  }

  void _initState() {
    _init();
    setState(() {
      isFireSuccess = widget.isFireSuccess;
      zMasterX = MeteoriteUtils().getDistanceMeteorites();
    });
    _onStartZMaster();
    dI<FireBloc>().add(const InitFire());
    dI<QuestionBloc>().add(const SelectQuestion(id: ''));
  }

  Future<void> _init() async {
    final Completer completer = Completer<List<Meteorite>>();
    dI<QuestionBloc>().add(SetRound(completer: completer));
    List<Meteorite> list = await completer.future;
    setState(() {
      totalQuestions = list.length;
    });
    if (dI<QuestionBloc>().state.round < 10) {
      for (int index = 0; index < 3; index++) {
        int delay = index == 0 ? 0 : meteoriteDelay;
        await Future.delayed(Duration(seconds: delay), () async {
          setState(() {
            currentIndex = index;
          });
          Completer completer = Completer<List<ItemMeteorite>>();
          dI<QuestionBloc>()
              .add(SetListCurrentQuestion(index: index, completer: completer));
          await completer.future;
        });
      }
    } else {
      for (int index = 0; index < 6; index++) {
        int delay = index == 0 ? 0 : meteoriteDelay;
        await Future.delayed(Duration(seconds: delay), () async {
          setState(() {
            currentIndex = index;
          });
          Completer completer = Completer<List<ItemMeteorite>>();
          dI<QuestionBloc>()
              .add(SetListCurrentQuestion(index: index, completer: completer));
          await completer.future;
        });
      }
    }
  }

  Future<void> _reset(int index, {String id = ""}) async {
    dI<KeyboardBloc>().add(const ChangeValueKeyboard(value: ""));
    widget.controller.text = '';
    await Future.delayed(const Duration(microseconds: 1), () async {
      final round = dI<QuestionBloc>().state.round;
      final bool isCheckFinal = round < 10
          ? index == totalQuestions - 1
          : index == (totalQuestions / 2) - 1;
      if (isCheckFinal) {
        dI<QuestionBloc>().add(const EndRound());
      } else {
        final bool isCheck = round < 10
            ? currentIndex < totalQuestions - 1
            : currentIndex < totalQuestions - 2;
        if (isCheck) {
          dI<QuestionBloc>().add(const GameOver());
          setState(() {
            if (round < 10) {
              currentIndex = currentIndex + 1;
            } else {
              currentIndex = currentIndex + 2;
            }
          });
          dI<QuestionBloc>().add(const SetMana(mana: 25));

          await Future.delayed(const Duration(seconds: 2), () async {
            Completer completer = Completer<List<ItemMeteorite>>();
            dI<QuestionBloc>().add(SetListCurrentQuestion(
                index: currentIndex, completer: completer));
            await completer.future;
            dI<QuestionBloc>().add(SetEnableMeteorite(
              index: currentIndex,
              isEnable: false,
            ));
          });
        } else {
          dI<QuestionBloc>().add(const GameOver());
        }
      }
    });
  }

  _onEndZMaster() {
    dI<QuestionBloc>().add(const SelectQuestion(id: ''));
    setState(() {
      isEnableZMaster = false;
    });
  }

  _onStartZMaster() async {
    Random random = Random();
    int randomNumber = random.nextInt(30);
    await Future.delayed(Duration(seconds: randomNumber), () {
      setState(() {
        isEnableZMaster = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionBloc, QuestionState>(
      listenWhen: (previous, current) => current.round != previous.round,
      listener: (context, state) {
        _initState();
      },
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              DetailMeteorite(
                id: ZMasterConstance.id,
                isEnable: isEnableZMaster,
                onEnd: () => _onEndZMaster(),
                isIntro: widget.isShowIntro,
                index: 100,
                onChangeIntro: () => widget.onChangeIntro.call(),
                time: 20,
                getPosition: (double value) => widget.getPosition(value),
                onSelect: () {
                  if (widget.isFireSuccess != FireStatus.done) {
                    dI<QuestionBloc>()
                        .add(SelectQuestion(id: ZMasterConstance.id));
                    dI<FireBloc>().add(const InitFire());
                  }
                  widget.onFireZMaster();
                },
                selected: state.id.isEmpty ? null : state.id,
                getX: (double value) => widget.getX(value),
                isFireSuccess: widget.isFireSuccess,
                introMeteorite: widget.introMeteorite,
                y: MediaQuery.sizeOf(context).height / 0.75,
                x: zMasterX,
                blood: 0,
                type: GameVocabularyType.none,
                screenType: widget.screenType,
              ),
              ...state.listCurrentMeteorite.mapIndexed((index, element) {
                return BlocBuilder<BuffBloc, BuffState>(
                  builder: (context, buffState) {
                    return DetailMeteorite(
                      listQuestion: element.listQuestion,
                      id: element.id,
                      isEnable: element.isEnable,
                      onEnd: () => {
                        dI<QuestionBloc>().add(const SelectQuestion(id: '')),
                        if (state.id == element.id) {},
                        _reset(index, id: element.id),
                        if (state.blood == 0)
                          {
                            for (int i = index; i < totalQuestions - 1; i++)
                              {
                                dI<QuestionBloc>().add(SetDefaultAnswer(
                                    id: state.listMeteorite[i].id)),
                              },
                          }
                      },
                      isIntro: widget.isShowIntro,
                      index: index,
                      onChangeIntro: () => widget.onChangeIntro.call(),
                      time: element.listQuestion.first.time,
                      getPosition: (double value) => widget.getPosition(value),
                      onSelect: () {
                        if (buffState.zBuffType != ZBuffType.unknown) {
                          widget.onFireBuff();
                          dI<BuffBloc>().add(const DeleteBuff());
                        }
                        if (widget.isFireSuccess != FireStatus.done) {
                          dI<QuestionBloc>()
                              .add(SelectQuestion(id: element.id));
                          dI<FireBloc>().add(const InitFire());
                        }
                      },
                      selected: state.id.isEmpty ? null : state.id,
                      getX: (double value) => widget.getX(value),
                      isFireSuccess: widget.isFireSuccess,
                      introMeteorite: widget.introMeteorite,
                      y: element.listQuestion.first.y,
                      x: element.listQuestion.first.x,
                      blood: element.listQuestion.first.percent,
                      type: element.listQuestion.first.gameVocabType,
                      onFireIntro: () => widget.onFireBuff.call(),
                      screenType: widget.screenType,
                    );
                  },
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
