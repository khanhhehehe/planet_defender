part of 'fire_bloc.dart';

sealed class FireEvent extends Equatable {
  const FireEvent();

  @override
  List<Object> get props => [];
}

class Fire extends FireEvent {
  final FireStatus status;
  const Fire({required this.status});
  @override
  List<Object> get props => [];
}

class InitFire extends FireEvent {
  const InitFire();
  @override
  List<Object> get props => [];
}
