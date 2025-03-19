part of 'countdown_time_bloc.dart';

sealed class CountdownTimeEvent extends Equatable {
  const CountdownTimeEvent();

  @override
  List<Object> get props => [];
}

class CountTime extends CountdownTimeEvent {
  const CountTime();

  @override
  List<Object> get props => [];
}

class SetExecutionTime extends CountdownTimeEvent {
  final int seconds;
  const SetExecutionTime({required this.seconds});

  @override
  List<Object> get props => [seconds];
}
