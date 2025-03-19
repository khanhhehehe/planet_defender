// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagUserResponse _$TagUserResponseFromJson(Map<String, dynamic> json) =>
    TagUserResponse(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      isLock: json['isLock'] as bool? ?? true,
    );

Map<String, dynamic> _$TagUserResponseToJson(TagUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isLock': instance.isLock,
    };
