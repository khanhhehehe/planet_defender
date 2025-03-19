import 'package:planet_defender/data/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questions_model.g.dart';

const _gameVocabularyTypesWithTitle = {
  GameVocabularyType.alternateSpelling: "AlternateSpelling",
  GameVocabularyType.usEquivalent: "UsEquivalent",
  GameVocabularyType.definition: "Definition",
  GameVocabularyType.hint: "Hint",
  GameVocabularyType.exampleSentence: "ExampleSentence",
  GameVocabularyType.image: "Image",
  GameVocabularyType.audio: "Audio",
  GameVocabularyType.synonym: "Synonym",
  GameVocabularyType.antonym: "Antonym",
  GameVocabularyType.phoneticTranscription: "PhoneticTranscription",
  GameVocabularyType.jumbledSpelling: "JumbledSpelling",
};

@JsonEnum(fieldRename: FieldRename.pascal)
enum GameVocabularyType {
  none,
  alternateSpelling,
  usEquivalent,
  definition,
  hint,
  exampleSentence,
  image,
  audio,
  synonym,
  antonym,
  phoneticTranscription,
  jumbledSpelling;

  String get title {
    return _gameVocabularyTypesWithTitle[this] ?? '';
  }
}

@JsonSerializable()
class QuestionsModel {
  final GameVocabularyType gameVocabType;
  final String questionContent;
  final List<String> alternateSpelling;
  final String gameVocabularyId;
  final String id;
  final String createdUserId;
  final String updatedUserId;
  final String createdFullName;
  final String updatedFullName;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? createdDate;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? updatedDate;

  const QuestionsModel({
    this.gameVocabType = GameVocabularyType.none,
    this.questionContent = "",
    this.alternateSpelling = const [],
    this.gameVocabularyId = '',
    this.id = "",
    this.createdUserId = "",
    this.updatedUserId = "",
    this.createdFullName = "",
    this.updatedFullName = "",
    this.createdDate,
    this.updatedDate,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsModelToJson(this);
}
