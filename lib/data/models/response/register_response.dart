import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final String fullName;
  final String id;
  final String createdUserId;
  const RegisterResponse(
      {this.fullName = '', this.id = '', this.createdUserId = ''});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class RegisterOtpResponse {
  final String accessToken;
  final String userId;

  const RegisterOtpResponse({required this.accessToken, this.userId = ''});

  factory RegisterOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterOtpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterOtpResponseToJson(this);
}
