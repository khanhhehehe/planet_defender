// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      fullName: json['fullName'] as String? ?? '',
      id: json['id'] as String? ?? '',
      createdUserId: json['createdUserId'] as String? ?? '',
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'id': instance.id,
      'createdUserId': instance.createdUserId,
    };

RegisterOtpResponse _$RegisterOtpResponseFromJson(Map<String, dynamic> json) =>
    RegisterOtpResponse(
      accessToken: json['accessToken'] as String,
      userId: json['userId'] as String? ?? '',
    );

Map<String, dynamic> _$RegisterOtpResponseToJson(
        RegisterOtpResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'userId': instance.userId,
    };
