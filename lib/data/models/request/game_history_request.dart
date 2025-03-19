import 'package:json_annotation/json_annotation.dart';

part 'game_history_request.g.dart';

@JsonSerializable()
class GameHistoryRequest {
  final String? id;
  final int roundNumber;
  final int score;
  final int numberOfToken;
  final int impactNumber;
  final int destroyNumber;
  final int comboNumber;
  final int zPlanetNumber;
  final int coin;

  GameHistoryRequest({
    this.id,
    this.roundNumber = 0,
    this.score = 0,
    this.numberOfToken = 0,
    this.impactNumber = 0,
    this.destroyNumber = 0,
    this.comboNumber = 0,
    this.zPlanetNumber = 0,
    this.coin = 0,
  });

  factory GameHistoryRequest.fromJson(Map<String, dynamic> json) =>
      _$GameHistoryRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GameHistoryRequestToJson(this);
}
