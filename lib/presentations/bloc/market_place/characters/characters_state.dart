import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/domain/entities/character.dart';

part 'characters_state.g.dart';

enum CharactersStatus {
  init,
  start,
  success,
  error,
}

@JsonSerializable()
@CopyWith()
class CharactersState extends Equatable {
  final CharactersStatus status;
  final Map<String, Character> characters;
  final List<String> characterIds;
  const CharactersState(
      {this.status = CharactersStatus.init,
      this.characters = const {},
      this.characterIds = const []});

  @override
  List<Object> get props => [status, characters, characterIds];
  factory CharactersState.fromJson(Map<String, dynamic> json) =>
      _$CharactersStateFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersStateToJson(this);
}
