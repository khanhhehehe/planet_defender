import 'dart:async';

import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/data/models/request/game_history_request.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_history/game_history_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_history/game_history_state.dart';
import 'package:planet_defender/presentations/bloc/question/question_bloc.dart';
import 'package:planet_defender/presentations/bloc/question/question_state.dart';

class Introduce extends StatefulWidget {
  const Introduce({super.key});

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  bool showIntro = false;
  bool isGameOver = false;
  bool isClear = false;

  setGameHistory(GameHistoryRequest request) async {
    Completer completer = Completer<GameHistoryStatus>();
    dI<GameHistoryBloc>().add(
        SaveGameHistory(gameHistoryRequest: request, completer: completer));
    GameHistoryStatus status = await completer.future;
    if (status == GameHistoryStatus.success) {
      Completer completerInit = Completer<bool>();
      dI<QuestionBloc>().add(InitQuestions(completer: completerInit));
      await completerInit.future;
    }
  }

  displayShowIntro(bool isGameOver) async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showIntro = false;
        isGameOver = false;
        isClear = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final theme = Theme.of(context).textTheme;
    return BlocConsumer<QuestionBloc, QuestionState>(
      listenWhen: (previous, current) {
        if (previous.round != current.round) {
          setState(() {
            showIntro = true;
            isGameOver = false;
          });
          return true;
        } else if (previous.isGameOver != current.isGameOver) {
          setState(() {
            showIntro = true;
            isGameOver = true;
          });
          return true;
        } else if (previous.endRound != current.endRound) {
          setState(() {
            showIntro = true;
            isClear = true;
          });
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) async {
        displayShowIntro(state.isGameOver);
        await Future.delayed(const Duration(seconds: 1), () {
          if (state.isGameOver) {
            setGameHistory(
              GameHistoryRequest(
                id: dI<GameHistoryBloc>().state.gameHistoryId,
                roundNumber: state.round,
                score: state.score,
                numberOfToken: state.coin,
                impactNumber: 0,
                destroyNumber: state.numberOfCorrectAnswers,
                comboNumber: state.combo,
                zPlanetNumber: dI<BuffBloc>().state.totalZMaster,
                coin: state.coin,
              ),
            );
            dI<AppNavigation>().replace(context, page: Pages.finalGamePlay);
          } else if (state.endRound) {
            dI<QuestionBloc>().add(CheckIsSpin());
          }
        });
      },
      builder: (context, state) {
        return showIntro
            ? BlocBuilder<QuestionBloc, QuestionState>(
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    color: colors.background.withOpacity(0.7),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.sizeOf(context).height / 2.5),
                      child: Text(
                        isGameOver
                            ? "GameOver"
                            : isClear
                                ? "Clear"
                                : "ROUND ${state.round}",
                        style: theme.displaySmall,
                      ),
                    ),
                  );
                },
              )
            : const SizedBox();
      },
    );
  }
}
