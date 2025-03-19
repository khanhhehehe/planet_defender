// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvatarUser _$AvatarUserFromJson(Map<String, dynamic> json) => AvatarUser(
      id: json['id'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      isLock: json['isLock'] as bool? ?? true,
    );

Map<String, dynamic> _$AvatarUserToJson(AvatarUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'isLock': instance.isLock,
    };
