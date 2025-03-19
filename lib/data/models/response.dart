import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ResponseBase {
  const ResponseBase({
    this.result,
    this.errorMessages = const [],
    this.statusCode = 404,
  });

  final dynamic result;
  final List<ErrorMessages> errorMessages;
  final int statusCode;

  factory ResponseBase.fromJson(Map<String, dynamic> json) =>
      _$ResponseBaseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseBaseToJson(this);
}

@JsonSerializable()
class ErrorMessages {
  final String? errorCode;
  final List<Errors>? errors;

  ErrorMessages({this.errorCode, this.errors});

  factory ErrorMessages.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessagesFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorMessagesToJson(this);
}

@JsonSerializable()
class Errors {
  final String? fieldName;
  final List<String>? errorValues;
  final List<String>? exactValues;

  Errors({this.fieldName, this.errorValues, this.exactValues});

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}
