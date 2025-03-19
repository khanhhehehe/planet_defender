import 'package:planet_defender/data/models/questions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questions.g.dart';

@JsonSerializable()
class Questions {
  final GameVocabularyType gameVocabType;
  final String questionContent;
  final List<String> alternateSpelling;
  final String gameVocabularyId;
  final String id;
  final String createdUserId;
  final String updatedUserId;
  final String createdFullName;
  final String updatedFullName;
  final DateTime? createdDate;
  final DateTime? updatedDate;

  const Questions({
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

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}
