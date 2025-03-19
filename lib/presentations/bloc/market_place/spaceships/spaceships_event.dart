part of 'spaceships_bloc.dart';

sealed class SpaceshipsEvent extends Equatable {
  const SpaceshipsEvent();

  @override
  List<Object> get props => [];
}

class GetSpaceships extends SpaceshipsEvent {
  const GetSpaceships();

  @override
  List<Object> get props => [];
}

class BuySpaceship extends SpaceshipsEvent {
  final String spaceShip;
  const BuySpaceship({required this.spaceShip});

  @override
  List<Object> get props => [spaceShip];
}
