// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvatarUserResponse _$AvatarUserResponseFromJson(Map<String, dynamic> json) =>
    AvatarUserResponse(
      id: json['id'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      isLock: json['isLock'] as bool? ?? true,
    );

Map<String, dynamic> _$AvatarUserResponseToJson(AvatarUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'isLock': instance.isLock,
    };
