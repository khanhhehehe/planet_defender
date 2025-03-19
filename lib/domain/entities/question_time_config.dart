import 'package:planet_defender/data/models/time_configs_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_time_config.g.dart';

@JsonSerializable()
class QuestionTimeConfigs {
  final int roundNumber;
  final List<TimeConfigsModel> gameplayTimeConfigs;

  const QuestionTimeConfigs({
    this.roundNumber = 0,
    this.gameplayTimeConfigs = const [],
  });

  factory QuestionTimeConfigs.fromJson(Map<String, dynamic> json) =>
      _$QuestionTimeConfigsFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionTimeConfigsToJson(this);
}
