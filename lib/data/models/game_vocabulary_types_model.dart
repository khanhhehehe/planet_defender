import 'package:json_annotation/json_annotation.dart';

part 'game_vocabulary_types_model.g.dart';

@JsonSerializable()
class GameVocabularyTypesModel {
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

  GameVocabularyTypesModel({
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

  factory GameVocabularyTypesModel.fromJson(Map<String, dynamic> json) =>
      _$GameVocabularyTypesModelFromJson(json);
  Map<String, dynamic> toJson() => _$GameVocabularyTypesModelToJson(this);
}
