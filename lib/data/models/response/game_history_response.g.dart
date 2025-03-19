// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameHistoryResponse _$GameHistoryResponseFromJson(Map<String, dynamic> json) =>
    GameHistoryResponse(
      roundNumber: json['roundNumber'] as int? ?? 0,
      score: json['score'] as int? ?? 0,
      spaceShipId: json['spaceShipId'] as String? ?? '',
      studentGameInfoId: json['studentGameInfoId'] as String? ?? '',
      spaceShipCode: json['spaceShipCode'] as String? ?? '',
      numberOfToken: json['numberOfToken'] as int? ?? 0,
      impactNumber: json['impactNumber'] as int? ?? 0,
      destroyNumber: json['destroyNumber'] as int? ?? 0,
      comboNumber: json['comboNumber'] as int? ?? 0,
      zPlanetNumber: json['zPlanetNumber'] as int? ?? 0,
      totalScore: json['totalScore'] as int? ?? 0,
      studentAnswers: (json['studentAnswers'] as List<dynamic>?)
              ?.map((e) =>
                  StudentAnswersResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as String? ?? '',
      createdUserId: json['createdUserId'] as String? ?? '',
      updatedUserId: json['updatedUserId'] as String? ?? '',
      createdFullName: json['createdFullName'] as String? ?? '',
      updatedFullName: json['updatedFullName'] as String? ?? '',
      createdDate: BaseModel.dateFromJson(json['createdDate'] as String?),
      updatedDate: BaseModel.dateFromJson(json['updatedDate'] as String?),
      coin: json['coin'] as int? ?? 0,
    );

Map<String, dynamic> _$GameHistoryResponseToJson(GameHistoryResponse instance) {
  final val = <String, dynamic>{
    'roundNumber': instance.roundNumber,
    'score': instance.score,
    'spaceShipId': instance.spaceShipId,
    'studentGameInfoId': instance.studentGameInfoId,
    'spaceShipCode': instance.spaceShipCode,
    'numberOfToken': instance.numberOfToken,
    'impactNumber': instance.impactNumber,
    'destroyNumber': instance.destroyNumber,
    'comboNumber': instance.comboNumber,
    'zPlanetNumber': instance.zPlanetNumber,
    'totalScore': instance.totalScore,
    'studentAnswers': instance.studentAnswers,
    'id': instance.id,
    'createdUserId': instance.createdUserId,
    'updatedUserId': instance.updatedUserId,
    'createdFullName': instance.createdFullName,
    'updatedFullName': instance.updatedFullName,
    'coin': instance.coin,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdDate', instance.createdDate?.toIso8601String());
  writeNotNull('updatedDate', instance.updatedDate?.toIso8601String());
  return val;
}
