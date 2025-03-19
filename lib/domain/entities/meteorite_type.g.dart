// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meteorite_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeteoriteType _$MeteoriteTypeFromJson(Map<String, dynamic> json) =>
    MeteoriteType(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      content: json['content'] as String? ?? '0',
      hint: json['hint'] as String? ?? '0',
    );

Map<String, dynamic> _$MeteoriteTypeToJson(MeteoriteType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'content': instance.content,
      'hint': instance.hint,
    };
