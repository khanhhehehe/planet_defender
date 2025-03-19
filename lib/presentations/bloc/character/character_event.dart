part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();
  @override
  List<Object> get props => [];
}

class SetCharacter extends CharacterEvent {
  final CharacterType character;
  const SetCharacter({
    required this.character,
  });

  @override
  List<Object> get props => [character];
}

class ChangeTab extends CharacterEvent {
  final SelectTabLevelType type;
  const ChangeTab({
    required this.type,
  });

  @override
  List<Object> get props => [type];
}

class SelectAcademic extends CharacterEvent {
  final AcademicType type;
  const SelectAcademic({
    required this.type,
  });

  @override
  List<Object> get props => [type];
}

class SelectIelts extends CharacterEvent {
  final IeltsType type;
  const SelectIelts({
    required this.type,
  });

  @override
  List<Object> get props => [type];
}

class SelectCharacter extends CharacterEvent {
  const SelectCharacter();

  @override
  List<Object> get props => [];
}
