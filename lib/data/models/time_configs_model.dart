import 'package:planet_defender/data/models/questions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_configs_model.g.dart';

@JsonSerializable()
class TimeConfigsModel {
  final String id;
  final int roundNumber;
  final GameVocabularyType gameVocabPDType;
  final int time;
  final int percent;

  const TimeConfigsModel(
      {this.id = '',
      this.roundNumber = 0,
      this.gameVocabPDType = GameVocabularyType.none,
      this.time = 0,
      this.percent = 0});

  factory TimeConfigsModel.fromJson(Map<String, dynamic> json) =>
      _$TimeConfigsModelFromJson(json);
  Map<String, dynamic> toJson() => _$TimeConfigsModelToJson(this);
}
