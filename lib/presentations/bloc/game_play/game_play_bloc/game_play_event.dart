part of 'game_play_bloc.dart';

sealed class GamePlayEvent extends Equatable {
  const GamePlayEvent();

  @override
  List<Object> get props => [];
}

class ChangeIntroScreens extends GamePlayEvent {
  const ChangeIntroScreens();
  @override
  List<Object> get props => [];
}

class InitIntroScreens extends GamePlayEvent {
  const InitIntroScreens();
  @override
  List<Object> get props => [];
}
