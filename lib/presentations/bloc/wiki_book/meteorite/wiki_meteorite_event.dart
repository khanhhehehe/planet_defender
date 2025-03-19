part of 'wiki_meteorite_bloc.dart';

sealed class WikiMeteoriteEvent extends Equatable {
  const WikiMeteoriteEvent();

  @override
  List<Object> get props => [];
}

class GetWikiMeteorite extends WikiMeteoriteEvent {
  const GetWikiMeteorite();

  @override
  List<Object> get props => [];
}
