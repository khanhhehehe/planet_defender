import 'package:planet_defender/data/models/time_configs_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_time_config_model.g.dart';

@JsonSerializable()
class QuestionTimeConfigsModel {
  final int roundNumber;
  final List<TimeConfigsModel> gameplayTimeConfigs;

  const QuestionTimeConfigsModel({
    this.roundNumber = 0,
    this.gameplayTimeConfigs = const [],
  });

  factory QuestionTimeConfigsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionTimeConfigsModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionTimeConfigsModelToJson(this);
}
