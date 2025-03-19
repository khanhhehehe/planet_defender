// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRegisterRequest _$UpdateRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateRegisterRequest(
      userId: json['userId'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      birthday: json['birthday'] as String? ?? '',
      yearBirthday: json['yearBirthday'] as int? ?? 0,
    );

Map<String, dynamic> _$UpdateRegisterRequestToJson(
        UpdateRegisterRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'yearBirthday': instance.yearBirthday,
    };
