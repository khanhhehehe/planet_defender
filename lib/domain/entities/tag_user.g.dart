// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagUser _$TagUserFromJson(Map<String, dynamic> json) => TagUser(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      isLock: json['isLock'] as bool? ?? true,
    );

Map<String, dynamic> _$TagUserToJson(TagUser instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isLock': instance.isLock,
    };
