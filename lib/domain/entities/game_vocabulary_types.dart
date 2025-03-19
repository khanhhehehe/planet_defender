import 'package:json_annotation/json_annotation.dart';

part 'game_vocabulary_types.g.dart';

@JsonSerializable()
class GameVocabularyTypes {
  final String id;
  final String createdUserId;
  final String updatedUserId;
  final String createdFullName;
  final String updatedFullName;
  final String createdDate;
  final String updatedDate;
  final String gameVocabType;
  final String questionContent;
  final List<String> alternateSpelling;
  final String gameVocabularyId;

  GameVocabularyTypes({
    this.id = '',
    this.createdUserId = '',
    this.updatedUserId = '',
    this.createdFullName = '',
    this.updatedFullName = '',
    this.createdDate = '',
    this.updatedDate = '',
    this.gameVocabType = '',
    this.questionContent = '',
    this.alternateSpelling = const [],
    this.gameVocabularyId = '',
  });

  factory GameVocabularyTypes.fromJson(Map<String, dynamic> json) =>
      _$GameVocabularyTypesFromJson(json);
  Map<String, dynamic> toJson() => _$GameVocabularyTypesToJson(this);
}
