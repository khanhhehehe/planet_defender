import 'package:json_annotation/json_annotation.dart';

part 'answer_the_question_request.g.dart';

@JsonSerializable()
class AnswerTheQuestionRequest {
  final String gameVocabularyId;
  final String gameVocabularyTypeId;
  final String gameHistoryId;
  final String answer;
  const AnswerTheQuestionRequest(
      {required this.gameVocabularyId,
      required this.gameVocabularyTypeId,
      required this.gameHistoryId,
      required this.answer});

  factory AnswerTheQuestionRequest.fromJson(Map<String, dynamic> json) =>
      _$AnswerTheQuestionRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerTheQuestionRequestToJson(this);
}
