import 'package:planet_defender/data/models/questions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_configs.g.dart';

@JsonSerializable()
class TimeConfig {
  final String id;
  final int roundNumber;
  final GameVocabularyType gameVocabPDType;
  final int time;
  final int percent;

  const TimeConfig(
      {this.id = '',
      this.roundNumber = 0,
      this.gameVocabPDType = GameVocabularyType.none,
      this.time = 0,
      this.percent = 0});

  factory TimeConfig.fromJson(Map<String, dynamic> json) =>
      _$TimeConfigFromJson(json);
  Map<String, dynamic> toJson() => _$TimeConfigToJson(this);
}
