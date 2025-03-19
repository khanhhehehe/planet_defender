import 'package:planet_defender/data/models/enums/character_type.dart';
import 'package:planet_defender/data/models/enums/level_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_state.g.dart';

enum CharacterStatus {
  init,
  success,
  failed,
}

@JsonSerializable()
@CopyWith()
class CharacterState extends Equatable {
  final CharacterType character;
  final AcademicType academicType;
  final IeltsType ieltsType;
  final SelectTabLevelType selectTabLevelType;
  final CharacterStatus status;

  const CharacterState(
      {this.character = CharacterType.unknown,
      this.academicType = AcademicType.unknown,
      this.ieltsType = IeltsType.unknown,
      this.selectTabLevelType = SelectTabLevelType.academic,
      this.status = CharacterStatus.init});

  @override
  List<Object?> get props =>
      [character, academicType, ieltsType, selectTabLevelType, status];

  factory CharacterState.fromJson(Map<String, dynamic> json) =>
      _$CharacterStateFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterStateToJson(this);
}
