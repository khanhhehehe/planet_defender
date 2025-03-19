// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseBase _$ResponseBaseFromJson(Map<String, dynamic> json) => ResponseBase(
      result: json['result'],
      errorMessages: (json['errorMessages'] as List<dynamic>?)
              ?.map((e) => ErrorMessages.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      statusCode: json['statusCode'] as int? ?? 404,
    );

Map<String, dynamic> _$ResponseBaseToJson(ResponseBase instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('result', instance.result);
  val['errorMessages'] = instance.errorMessages;
  val['statusCode'] = instance.statusCode;
  return val;
}

ErrorMessages _$ErrorMessagesFromJson(Map<String, dynamic> json) =>
    ErrorMessages(
      errorCode: json['errorCode'] as String?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => Errors.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorMessagesToJson(ErrorMessages instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errors', instance.errors);
  return val;
}

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      fieldName: json['fieldName'] as String?,
      errorValues: (json['errorValues'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      exactValues: (json['exactValues'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fieldName', instance.fieldName);
  writeNotNull('errorValues', instance.errorValues);
  writeNotNull('exactValues', instance.exactValues);
  return val;
}
