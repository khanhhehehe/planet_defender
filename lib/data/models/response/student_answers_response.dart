import 'package:planet_defender/data/models/questions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_answers_response.g.dart';

@JsonSerializable()
class StudentAnswersResponse {
  GameVocabularyType type;
  String questionContent;
  String key;
  String answer;
  bool isCorrect;

  StudentAnswersResponse({
    this.type = GameVocabularyType.none,
    this.questionContent = "",
    this.key = '',
    this.answer = '',
    this.isCorrect = false,
  });

  factory StudentAnswersResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentAnswersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StudentAnswersResponseToJson(this);
}
