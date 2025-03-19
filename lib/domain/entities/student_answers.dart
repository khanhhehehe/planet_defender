import 'package:planet_defender/data/models/questions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_answers.g.dart';

@JsonSerializable()
class StudentAnswers {
  GameVocabularyType type;
  String questionContent;
  String key;
  String answer;
  bool isCorrect;

  StudentAnswers({
    this.type = GameVocabularyType.none,
    this.questionContent = "",
    this.key = '',
    this.answer = '',
    this.isCorrect = false,
  });

  factory StudentAnswers.fromJson(Map<String, dynamic> json) =>
      _$StudentAnswersFromJson(json);
  Map<String, dynamic> toJson() => _$StudentAnswersToJson(this);
}
