// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_history_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameHistoryRequest _$GameHistoryRequestFromJson(Map<String, dynamic> json) =>
    GameHistoryRequest(
      id: json['id'] as String?,
      roundNumber: json['roundNumber'] as int? ?? 0,
      score: json['score'] as int? ?? 0,
      numberOfToken: json['numberOfToken'] as int? ?? 0,
      impactNumber: json['impactNumber'] as int? ?? 0,
      destroyNumber: json['destroyNumber'] as int? ?? 0,
      comboNumber: json['comboNumber'] as int? ?? 0,
      zPlanetNumber: json['zPlanetNumber'] as int? ?? 0,
      coin: json['coin'] as int? ?? 0,
    );

Map<String, dynamic> _$GameHistoryRequestToJson(GameHistoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['roundNumber'] = instance.roundNumber;
  val['score'] = instance.score;
  val['numberOfToken'] = instance.numberOfToken;
  val['impactNumber'] = instance.impactNumber;
  val['destroyNumber'] = instance.destroyNumber;
  val['comboNumber'] = instance.comboNumber;
  val['zPlanetNumber'] = instance.zPlanetNumber;
  val['coin'] = instance.coin;
  return val;
}
