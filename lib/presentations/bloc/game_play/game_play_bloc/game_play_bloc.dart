import 'dart:async';

import 'package:planet_defender/common/constants/step_intro_play_game.dart';
import 'package:planet_defender/common/utils/key_board_utils.dart';
import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:planet_defender/presentations/bloc/game_play/game_play_bloc/game_play_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'game_play_event.dart';

@lazySingleton
class GamePlayBloc extends Bloc<GamePlayEvent, GamePlayState> {
  GamePlayBloc() : super(GamePlayStateInitial()) {
    on<ChangeIntroScreens>(_changeIntroScreens);
    on<InitIntroScreens>(_init);
  }

  FutureOr<void> _changeIntroScreens(
      ChangeIntroScreens event, Emitter<GamePlayState> emit) async {
    emit(state.copyWith(type: steps[state.type]));
    if (state.type == GamePlayScreensType.inputCaptainName) {
      emit(state.copyWith(isShowKeyBoard: true, isShowKeyBoardAndIntro: true));
    } else if (checkShowKeyBoardAndIntro(state.type)) {
      emit(state.copyWith(isShowKeyBoard: false, isShowKeyBoardAndIntro: true));
    } else if (checkShowKeyBoard(state.type)) {
      emit(state.copyWith(
        isShowQuest: true,
        isShowKeyBoard: true,
        isShowKeyBoardAndIntro: false,
      ));
    } else {
      emit(state.copyWith(
        isShowKeyBoard: false,
        isShowKeyBoardAndIntro: false,
      ));
    }
  }

  FutureOr<void> _init(
      InitIntroScreens event, Emitter<GamePlayState> emit) async {
    emit(state.copyWith(
      type: GamePlayScreensType.intro1,
      isShowQuest: false,
      isShowKeyBoard: false,
      isShowKeyBoardAndIntro: false,
    ));
  }
}
