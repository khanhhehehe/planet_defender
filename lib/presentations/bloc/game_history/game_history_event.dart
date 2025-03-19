part of 'game_history_bloc.dart';

class GameHistoryEvent extends Equatable {
  const GameHistoryEvent();

  @override
  List<Object> get props => [];
}

class SaveGameHistory extends GameHistoryEvent {
  final GameHistoryRequest gameHistoryRequest;
  final Completer completer;
  const SaveGameHistory(
      {required this.gameHistoryRequest, required this.completer});

  @override
  List<Object> get props => [gameHistoryRequest, completer];
}

class InitGameHistory extends GameHistoryEvent {
  const InitGameHistory();

  @override
  List<Object> get props => [];
}

class ResetGameHistory extends GameHistoryEvent {
  const ResetGameHistory();

  @override
  List<Object> get props => [];
}

class GetGameHistory extends GameHistoryEvent {
  const GetGameHistory();

  @override
  List<Object> get props => [];
}
