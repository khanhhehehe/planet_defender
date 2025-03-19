import 'package:planet_defender/data/models/questions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meteorite.g.dart';

@JsonSerializable()
class Meteorite {
  final String id;
  final GameVocabularyType gameVocabType;
  final int roundNumber;
  final String questionContent;
  final int time;
  final int percent;
  final double y;
  final double x;
  final bool isEnable;

  const Meteorite({
    this.id = '',
    this.isEnable = false,
    this.gameVocabType = GameVocabularyType.none,
    this.roundNumber = 0,
    this.questionContent = "",
    this.time = 0,
    this.percent = 0,
    this.y = 0,
    this.x = 0,
  });

  factory Meteorite.fromJson(Map<String, dynamic> json) =>
      _$MeteoriteFromJson(json);
  Map<String, dynamic> toJson() => _$MeteoriteToJson(this);
}
