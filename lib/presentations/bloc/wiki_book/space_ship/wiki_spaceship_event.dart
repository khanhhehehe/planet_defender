part of 'wiki_spaceship_bloc.dart';

sealed class WikiSpaceshipsEvent extends Equatable {
  const WikiSpaceshipsEvent();

  @override
  List<Object> get props => [];
}

class GetWikiSpaceships extends WikiSpaceshipsEvent {
  const GetWikiSpaceships();

  @override
  List<Object> get props => [];
}
