import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/request/game_history_request.dart';
import 'package:planet_defender/domain/entities/game_history.dart';
import 'package:planet_defender/domain/use_cases/game_history_usecase.dart';
import 'package:planet_defender/presentations/bloc/game_history/game_history_state.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'game_history_event.dart';

@lazySingleton
class GameHistoryBloc extends HydratedBloc<GameHistoryEvent, GameHistoryState> {
  final GameHistoryUseCase _gameHistoryUseCase;
  GameHistoryBloc()
      : _gameHistoryUseCase = dI<GameHistoryUseCase>(),
        super(GameHistoryInitial()) {
    on<SaveGameHistory>(_saveGameHistory);
    on<InitGameHistory>(_init);
    on<GetGameHistory>(_getGameHistory);
    on<ResetGameHistory>(_resetGameHistory);
  }

  FutureOr<void> _saveGameHistory(
      SaveGameHistory event, Emitter<GameHistoryState> emit) async {
    emit(state.copyWith(gameHistoryStatus: GameHistoryStatus.fail));
    try {
      String id = await _gameHistoryUseCase.saveGameHistory(
          request: event.gameHistoryRequest);
      emit(state.copyWith(
          gameHistoryStatus: GameHistoryStatus.success, gameHistoryId: id));
      event.completer.complete(GameHistoryStatus.success);
    } catch (e) {
      emit(state.copyWith(gameHistoryStatus: GameHistoryStatus.fail));
      event.completer.complete(GameHistoryStatus.fail);
    }
  }

  FutureOr<void> _init(InitGameHistory event, Emitter<GameHistoryState> emit) {
    emit(state.copyWith(gameHistoryStatus: GameHistoryStatus.fail));
  }

  Future<FutureOr<void>> _getGameHistory(
      GetGameHistory event, Emitter<GameHistoryState> emit) async {
    GameHistory data = await _gameHistoryUseCase.getGameHistory(
        gameHistoryId: state.gameHistoryId);
    emit(state.copyWith(gameHistory: data));
  }

  @override
  GameHistoryState? fromJson(Map<String, dynamic> json) {
    return GameHistoryState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(GameHistoryState state) {
    return state.toJson();
  }

  FutureOr<void> _resetGameHistory(
      ResetGameHistory event, Emitter<GameHistoryState> emit) {
    emit(state.copyWith(gameHistoryId: "", gameHistory: const GameHistory()));
  }
}
