// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameTopic _$GameTopicFromJson(Map<String, dynamic> json) => GameTopic(
      id: json['id'] as String? ?? "",
      createdUserId: json['createdUserId'] as String? ?? "",
      updatedUserId: json['updatedUserId'] as String? ?? "",
      createdFullName: json['createdFullName'] as String? ?? "",
      updatedFullName: json['updatedFullName'] as String? ?? "",
      createdDate: json['createdDate'] as String? ?? "",
      updatedDate: json['updatedDate'] as String? ?? "",
      unitOrder: json['unitOrder'] as String? ?? "",
      value: json['value'] as String? ?? "",
      skill: json['skill'] as String? ?? "",
      courseLevel: json['courseLevel'] as String? ?? "",
    );

Map<String, dynamic> _$GameTopicToJson(GameTopic instance) => <String, dynamic>{
      'id': instance.id,
      'createdUserId': instance.createdUserId,
      'updatedUserId': instance.updatedUserId,
      'createdFullName': instance.createdFullName,
      'updatedFullName': instance.updatedFullName,
      'createdDate': instance.createdDate,
      'updatedDate': instance.updatedDate,
      'unitOrder': instance.unitOrder,
      'value': instance.value,
      'skill': instance.skill,
      'courseLevel': instance.courseLevel,
    };
