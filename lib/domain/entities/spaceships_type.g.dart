// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spaceships_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceshipsType _$SpaceshipsTypeFromJson(Map<String, dynamic> json) =>
    SpaceshipsType(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      content: json['content'] as String? ?? '0',
      hint: json['hint'] as String? ?? '0',
      isLock: json['isLock'] as bool? ?? false,
    );

Map<String, dynamic> _$SpaceshipsTypeToJson(SpaceshipsType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'content': instance.content,
      'hint': instance.hint,
      'isLock': instance.isLock,
    };
