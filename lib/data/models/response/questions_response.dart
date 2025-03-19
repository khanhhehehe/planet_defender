import 'package:planet_defender/data/models/questions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questions_response.g.dart';

@JsonSerializable()
class QuestionsResponse {
  final List<QuestionsModel> listQuestion;

  const QuestionsResponse({
    this.listQuestion = const [],
  });

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}
