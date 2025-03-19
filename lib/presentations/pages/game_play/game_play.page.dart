import 'dart:async';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/constants/step_intro_play_game.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/common/utils/buff_utils.dart';
import 'package:planet_defender/common/utils/key_board_utils.dart';
import 'package:planet_defender/data/models/enums/check_answer_type.dart';
import 'package:planet_defender/data/models/enums/fire_status.dart';
import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:planet_defender/data/models/enums/z_buff_types.dart';
import 'package:planet_defender/domain/entities/meteorite_detail.dart';
import 'package:planet_defender/domain/entities/questions.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_play/fire_bloc/fire_bloc.dart';
import 'package:planet_defender/presentations/bloc/key_board/keyboard_bloc.dart';
import 'package:planet_defender/presentations/bloc/key_board/keyboard_state.dart';
import 'package:planet_defender/presentations/bloc/question/question_bloc.dart';
import 'package:planet_defender/presentations/bloc/question/question_state.dart';
import 'package:planet_defender/presentations/bloc/user/user_bloc.dart';
import 'package:planet_defender/presentations/bloc/user/user_state.dart';
import 'package:planet_defender/presentations/pages/form_quest_question.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/body_game_play.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/intro_popup.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/introduce.dart';
import 'package:planet_defender/presentations/pages/wheel_of_fortune.dart';
import 'package:base_widgets/dialogs/message_dialog.dart';
import 'package:base_widgets/layout/layout_game_play.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_defender/presentations/themes/base_color.dart';

final gamePlayPageRoute = GoRoute(
    path: Pages.gamePlay,
    builder: (context, GoRouterState state) {
      if (state.uri.hasQuery) {
        final params = state.uri.queryParameters;
        final isIntro = bool.tryParse(params["data"] ?? '');
        return GamePlayPage(isIntro: isIntro ?? false);
      }
      return const GamePlayPage(isIntro: false);
    });

class GamePlayPage extends StatefulWidget {
  final bool isIntro;
  const GamePlayPage({super.key, required this.isIntro});
  @override
  State<GamePlayPage> createState() => _GamePlayPageState();
}

class _GamePlayPageState extends State<GamePlayPage>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> offset;
  bool isShowKeyBoard = false;
  bool isShowQuest = false;
  bool isShowKeyBoardAndIntro = false;
  bool isFire = false;
  bool isIntroSkill = true;
  int count = 0;
  FireStatus fireStatus = FireStatus.none;
  late TextEditingController _controller;
  CheckAnswerType answerSuccess = CheckAnswerType.init;
  late GamePlayScreensType type;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
    _init();
  }

  void _init() {
    setState(() {
      type = widget.isIntro
          ? GamePlayScreensType.intro1
          : GamePlayScreensType.gamePlay;
    });
    if (type == GamePlayScreensType.gamePlay) {
      setState(() {
        isShowKeyBoard = true;
        isShowQuest = true;
      });
    }
    dI<FireBloc>().add(const InitFire());
  }

  void _onConfirm() {
    setState(() {
      isShowKeyBoard = false;
      type = GamePlayScreensType.intro2;
    });
  }

  void _onResetFire() {
    setState(() {
      fireStatus = FireStatus.none;
    });
  }

  Future<void> _enter({bool checkAnswer = false, required String id}) async {
    if (type == GamePlayScreensType.gamePlayFireButton ||
        type == GamePlayScreensType.gamePlay ||
        type == GamePlayScreensType.gameIntroFireSkill) {
      final round = dI<QuestionBloc>().state.round;
      final listDone = dI<QuestionBloc>().state.listIdDone;
      final listId = id.split("_");
      bool checkQuestionIdFirst =
          listDone.where((element) => element == listId.first).isNotEmpty;
      Completer completer = Completer<bool>();
      if (round < 10) {
        dI<QuestionBloc>().add(AnswerTheQuestion(
            answer: _controller.text, completer: completer, id: id));
      } else {
        if (checkQuestionIdFirst) {
          dI<QuestionBloc>().add(AnswerTheQuestion(
              answer: _controller.text, completer: completer, id: listId.last));
        } else {
          dI<QuestionBloc>().add(AnswerTheQuestion(
              answer: _controller.text,
              completer: completer,
              id: listId.first));
        }
      }
      final check = await completer.future;
      _controller.text = '';
      if (check == true) {
        dI<KeyboardBloc>().add(const ChangeValueKeyboard(value: ''));
        dI<QuestionBloc>().add(const SetScore(score: 100));
        dI<QuestionBloc>().add(const SetCoin(coin: 1));
        dI<QuestionBloc>().add(const SetMana(mana: 25));
        dI<QuestionBloc>().add(SetCombo());
        setState(() {
          if (round < 10) {
            answerSuccess = CheckAnswerType.success;
            isFire = true;
            fireStatus = FireStatus.done;
          } else {
            answerSuccess = CheckAnswerType.success;
            if (checkQuestionIdFirst) {
              isFire = true;
              fireStatus = FireStatus.done;
            }
          }
        });
      } else {
        setState(() {
          answerSuccess = CheckAnswerType.fail;
        });
      }
    }
  }

  void _enterSpecialSkill() {
    dI<QuestionBloc>().add(const SetScore(score: 100));
    dI<QuestionBloc>().add(const SetCoin(coin: 1));
    setState(() {
      isFire = true;
      fireStatus = FireStatus.done;
    });
  }

  void _enterZMaster() {
    setState(() {
      isFire = true;
      fireStatus = FireStatus.done;
    });
    final buff = BuffUtils().randomBuff();
    dI<BuffBloc>().add(AddBuff(type: buff));
    dI<BuffBloc>().add(const SetCountZMaster(item: 1));
  }

  void _enterBuff() {
    setState(() {
      isFire = true;
      fireStatus = FireStatus.done;
    });
    dI<QuestionBloc>().add(const SetScore(score: 100));
    dI<QuestionBloc>().add(const SetCoin(coin: 1));
    dI<QuestionBloc>().add(const SetMana(mana: 25));
  }

  void _onCloseIntroBtnSkill() {
    setState(() {
      isIntroSkill = false;
    });
  }

  void _onTapScreen(bool isCheckNickname) {
    if (type != GamePlayScreensType.inputCaptainName &&
        widget.isIntro == true) {
      if (type != GamePlayScreensType.gameButtonSkill &&
          type != GamePlayScreensType.gameShowIntroSelectMeteorite &&
          type != GamePlayScreensType.gamePlay &&
          type != GamePlayScreensType.gamePlayFireButton) {
        _onChangeScreen(isCheckNickname);
      }
    }
  }

  Questions _getQuestionsContent(
      {required Map<String, Questions> data,
      required String id,
      required List<ItemMeteorite> selectData}) {
    List<String> listId = id.split("_");
    return data[listId.first] ?? const Questions();
  }

  bool _checkTheAnswer(
      {required Map<String, Questions> data,
      required String id,
      required String answer}) {
    if (data.isEmpty) return false;
    final dataAnswer = data[id]?.alternateSpelling;
    if (dataAnswer == null || answer.isEmpty) return false;
    try {
      bool isDone =
          dataAnswer.singleWhere((element) => element == answer).isNotEmpty;
      return isDone;
    } catch (e) {
      return false;
    }
  }

  Future<void> _resetAnswer() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        answerSuccess = CheckAnswerType.init;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<QuestionBloc, QuestionState>(
      builder: (context, questionState) {
        if (questionState.isSpin) {
          return const WheelOfFortune();
        } else {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () =>
                        _onTapScreen(state.userInfo.nickName.isNotEmpty),
                    child: LayoutGamePlay(
                        isFullMana: false,
                        pathImageBackgroundFullMana: Assets.images.freeze.path,
                        pathImageBackground: Assets.images.bgGamePlay.path,
                        widgets: bodyGamePlay(
                          context: context,
                          type: type,
                          isFire: isFire,
                          onConfirm: () => _onConfirm(),
                          onTapIntroGamePlay: () => _onChangeScreen(
                              state.userInfo.nickName.isNotEmpty),
                          fireStatus: fireStatus,
                          onResetFire: () => _onResetFire(),
                          isIntro: widget.isIntro,
                          useSkill: () {
                            _enterSpecialSkill();
                            _resetAnswer();
                          },
                          controller: _controller,
                          onFireZMaster: () => _enterZMaster(),
                          onFireBuff: () => _enterBuff(),
                        )),
                  );
                },
              ),
              _introOrKeyboard(),
              ..._messageDialog(),
              const Introduce(),
              if (type == GamePlayScreensType.endIntro)
                GestureDetector(
                  onTap: () =>
                      dI<AppNavigation>().replace(context, page: Pages.home),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    color: colors.background.withOpacity(0.7),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.sizeOf(context).height / 2.5),
                      child: Text(
                        "GameOver",
                        style: theme.textTheme.displaySmall,
                      ),
                    ),
                  ),
                )
            ],
          );
        }
      },
    );
  }

  Widget _introOrKeyboard() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return BlocBuilder<QuestionBloc, QuestionState>(
          builder: (context, questionState) {
            return BlocBuilder<KeyboardBloc, KeyboardState>(
              builder: (context, keyboardState) {
                return Container(
                  child: isShowKeyBoard
                      ? FormQuestQuestion(
                          controller: _controller,
                          onChange: (data) {
                            dI<KeyboardBloc>()
                                .add(ChangeValueKeyboard(value: data));
                          },
                          showQuest: isShowQuest,
                          enter: () {
                            bool check = _checkTheAnswer(
                                data: questionState.questionDetails,
                                id: questionState.id,
                                answer: keyboardState.value);
                            _enter(checkAnswer: check, id: questionState.id);
                            _resetAnswer();
                            if (type ==
                                GamePlayScreensType.gamePlayFireButton) {
                              _onChangeScreen(
                                  state.userInfo.nickName.isNotEmpty);
                            }
                          },
                          onCloseIntroBtnSkill: () => _onCloseIntroBtnSkill(),
                          onCancel: () {
                            if (type != GamePlayScreensType.inputCaptainName) {
                              dI<QuestionBloc>().add(
                                const SelectQuestion(id: ''),
                              );
                            }
                          },
                          isSelectCancel:
                              type == GamePlayScreensType.gamePlayBtnCancelFire,
                          autoSelectItem: type ==
                              GamePlayScreensType.gameIntroSelectMeteorite,
                          introSkillItem:
                              type == GamePlayScreensType.gameButtonSkill,
                          imageBackground: Assets.images.bgKeyBoard.path,
                          answerSuccess: answerSuccess,
                          imageBackgroundMedia:
                              answerSuccess == CheckAnswerType.success
                                  ? Assets.images.mediaSs.path
                                  : answerSuccess == CheckAnswerType.fail
                                      ? Assets.images.mediaFail.path
                                      : Assets.images.media.path,
                          imageBackgroundQuest:
                              answerSuccess == CheckAnswerType.success
                                  ? Assets.images.questContainerSs.path
                                  : answerSuccess == CheckAnswerType.fail
                                      ? Assets.images.questContainerFail.path
                                      : Assets.images.questContainer.path,
                          formFire: Assets.images.formKeyBoard.path,
                          buttonEnter: Assets.images.btnSciFiKey.path,
                          isIntroFire:
                              type == GamePlayScreensType.gamePlayFireButton &&
                                  isFire == false,
                          isIntroButtonSkill:
                              GamePlayScreensType.gameButtonSkill == type &&
                                  isIntroSkill == true,
                          questionData: _getQuestionsContent(
                              selectData: questionState.listCurrentMeteorite,
                              data: questionState.questionDetails,
                              id: questionState.id),
                          isIntroNextQuestion:
                              type == GamePlayScreensType.gamePlayBtnCancelFire,
                        )
                      : isShowKeyBoardAndIntro
                          ? Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                FormQuestQuestion(
                                    controller: _controller,
                                    onChange: (value) {},
                                    showQuest: isShowQuest,
                                    enter: () {},
                                    isIntroFire: type ==
                                            GamePlayScreensType
                                                .gamePlayFireButton &&
                                        isFire == false,
                                    imageBackground:
                                        Assets.images.bgKeyBoard.path,
                                    imageBackgroundMedia:
                                        Assets.images.media.path,
                                    imageBackgroundQuest:
                                        Assets.images.questContainer.path,
                                    formFire: Assets.images.formKeyBoard.path,
                                    buttonEnter: Assets.images.btnSciFiKey.path,
                                    introMedia: type ==
                                        GamePlayScreensType.gamePlayIntroMedia,
                                    introHint: type ==
                                        GamePlayScreensType.gamePlayIntroHint,
                                    isAnalysisBoard: type ==
                                        GamePlayScreensType
                                            .gamePlayAnalysisBoard,
                                    isIntroContainer: type ==
                                        GamePlayScreensType.gamePlayContainer,
                                    questionData: const Questions(),
                                    isIntroNextQuestion: type ==
                                        GamePlayScreensType
                                            .gamePlayBtnCancelFire),
                                Intro(
                                  isShowRobotLeft: _showRobotLeft(),
                                  isShowRobotRight: _showRobotRight(),
                                  type: type,
                                  onTap: () => _onChangeScreen(
                                      state.userInfo.nickName.isNotEmpty),
                                ),
                              ],
                            )
                          : Intro(
                              type: type,
                              onTap: () => _onChangeScreen(
                                  state.userInfo.nickName.isNotEmpty),
                            ),
                );
              },
            );
          },
        );
      },
    );
  }

  _onChangeScreen(bool isCheckNickname) {
    GamePlayScreensType nextType = GamePlayScreensType.none;
    if (steps[type] == GamePlayScreensType.inputCaptainName &&
        isCheckNickname) {
      nextType = steps[GamePlayScreensType.inputCaptainName] ??
          GamePlayScreensType.none;
    } else {
      nextType = steps[type] ?? GamePlayScreensType.intro1;
    }
    setState(() {
      if (nextType == GamePlayScreensType.inputCaptainName) {
        type = nextType;
        isShowKeyBoard = true;
        isShowKeyBoardAndIntro = false;
      } else if (checkShowKeyBoardAndIntro(nextType)) {
        type = nextType;
        isShowKeyBoardAndIntro = true;
        isShowKeyBoard = false;
      } else if (checkShowKeyBoard(nextType)) {
        type = nextType;
        isShowKeyBoardAndIntro = false;
        isShowKeyBoard = true;
        isShowQuest = true;
      } else {
        isShowKeyBoard = false;
        type = nextType;
      }
    });
    if (type == GamePlayScreensType.gamePlay) {
      Future.delayed(
          const Duration(seconds: 3),
          () => {
                dI<QuestionBloc>()
                    .add(const ChangePauseStatus(pauseStatus: true)),
                _onChangeScreen(isCheckNickname)
              });
    }
    if (type == GamePlayScreensType.gameShowIntroFireSkill) {
      dI<BuffBloc>().add(const SetBuff(type: ZBuffType.unknown));
      dI<BuffBloc>().add(const DeleteBuff());
    }
  }

  List<Widget> _messageDialog() {
    return [
      if (type == GamePlayScreensType.gamePlayIntroMedia ||
          type == GamePlayScreensType.gamePlayAnalysisBoard ||
          type == GamePlayScreensType.gamePlayContainer ||
          type == GamePlayScreensType.gamePlayFireButton ||
          type == GamePlayScreensType.gamePlayIntroHint)
        !isFire
            ? Positioned(
                left: type == GamePlayScreensType.gamePlayFireButton
                    ? MediaQuery.sizeOf(context).width / 1.3
                    : null,
                right: type == GamePlayScreensType.gamePlayIntroHint
                    ? MediaQuery.sizeOf(context).width / 1.28
                    : type == GamePlayScreensType.gamePlayAnalysisBoard
                        ? MediaQuery.sizeOf(context).width / 3
                        : null,
                bottom: type == GamePlayScreensType.gamePlayContainer
                    ? MediaQuery.sizeOf(context).height / 3.8
                    : type == GamePlayScreensType.gamePlayFireButton
                        ? MediaQuery.sizeOf(context).height / 3.1
                        : MediaQuery.sizeOf(context).height / 2.6,
                child: MessageDialog(
                  title: type == GamePlayScreensType.gamePlayAnalysisBoard
                      ? "Analysis board"
                      : type == GamePlayScreensType.gamePlayIntroHint
                          ? "Hint"
                          : type == GamePlayScreensType.gamePlayContainer
                              ? "Container"
                              : type == GamePlayScreensType.gamePlayFireButton
                                  ? "Fire button"
                                  : "Media",
                ),
              )
            : const SizedBox(),
      if (type == GamePlayScreensType.gameButtonSkill && isIntroSkill)
        Positioned(
          top: MediaQuery.sizeOf(context).height / 2.5,
          left: 2.5,
          child: SizedBox(
              width: MediaQuery.sizeOf(context).width / 3.5,
              child: const MessageDialog(title: "Z buff")),
        ),
    ];
  }

  bool _showRobotLeft() {
    if (type != GamePlayScreensType.gamePlayIntroMedia &&
        type != GamePlayScreensType.gamePlayIntroHint &&
        type != GamePlayScreensType.gamePlayContainer) {
      return true;
    }
    return false;
  }

  bool _showRobotRight() {
    if (type == GamePlayScreensType.gamePlayIntroHint ||
        type == GamePlayScreensType.gamePlayContainer) {
      return true;
    }
    return false;
  }
}
