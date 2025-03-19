// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_configs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
      platformCode: json['ENV'] as String? ?? '',
      env: json['PLATFORM_CODE'] as String? ?? '',
      baseUrl: json['BASE_URL'] as String? ?? '',
      baseApiUrl: json['AUTH_BASE_URL'] as String? ?? '',
    );

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'AUTH_BASE_URL': instance.baseApiUrl,
      'BASE_URL': instance.baseUrl,
      'ENV': instance.platformCode,
      'PLATFORM_CODE': instance.env,
    };
