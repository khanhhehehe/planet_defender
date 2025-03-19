import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@CopyWith()
@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'fullName')
  final String fullName;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phoneNumber')
  final String numberPhone;
  @JsonKey(name: 'referralCode')
  final String referralCode;
  @JsonKey(name: 'role')
  final String role;
  @JsonKey(name: 'platformCode')
  final String platformCode;
  const RegisterRequest(
      {this.fullName = '',
      this.referralCode = '',
      this.password = '',
      this.email = '',
      this.numberPhone = '',
      this.role = '',
      this.platformCode = ''});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
