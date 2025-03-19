// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_time_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionTimeConfigs _$QuestionTimeConfigsFromJson(Map<String, dynamic> json) =>
    QuestionTimeConfigs(
      roundNumber: json['roundNumber'] as int? ?? 0,
      gameplayTimeConfigs: (json['gameplayTimeConfigs'] as List<dynamic>?)
              ?.map((e) => TimeConfigsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$QuestionTimeConfigsToJson(
        QuestionTimeConfigs instance) =>
    <String, dynamic>{
      'roundNumber': instance.roundNumber,
      'gameplayTimeConfigs': instance.gameplayTimeConfigs,
    };
