part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class GetCharacters extends CharactersEvent {
  const GetCharacters();

  @override
  List<Object> get props => [];
}

class BuyCharacter extends CharactersEvent {
  final String characterId;
  const BuyCharacter({required this.characterId});

  @override
  List<Object> get props => [characterId];
}
