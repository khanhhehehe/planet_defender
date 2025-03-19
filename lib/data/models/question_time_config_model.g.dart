// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_time_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionTimeConfigsModel _$QuestionTimeConfigsModelFromJson(
        Map<String, dynamic> json) =>
    QuestionTimeConfigsModel(
      roundNumber: json['roundNumber'] as int? ?? 0,
      gameplayTimeConfigs: (json['gameplayTimeConfigs'] as List<dynamic>?)
              ?.map((e) => TimeConfigsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$QuestionTimeConfigsModelToJson(
        QuestionTimeConfigsModel instance) =>
    <String, dynamic>{
      'roundNumber': instance.roundNumber,
      'gameplayTimeConfigs': instance.gameplayTimeConfigs,
    };
