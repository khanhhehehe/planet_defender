part of 'meteorite_bloc.dart';

sealed class MeteoriteEvent extends Equatable {
  const MeteoriteEvent();

  @override
  List<Object> get props => [];
}

class SelectMeteorite extends MeteoriteEvent {
  final String index;
  const SelectMeteorite({
    required this.index,
  });
  @override
  List<Object> get props => [index];
}

class Init extends MeteoriteEvent {
  const Init();
  @override
  List<Object> get props => [];
}
