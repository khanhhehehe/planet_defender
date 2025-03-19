import 'package:json_annotation/json_annotation.dart';

part 'update_register_request.g.dart';

@JsonSerializable()
class UpdateRegisterRequest {
  final String userId;
  final String gender;
  final String birthday;
  final int yearBirthday;
  const UpdateRegisterRequest(
      {this.userId = '',
      this.gender = '',
      this.birthday = '',
      this.yearBirthday = 0});

  factory UpdateRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateRegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateRegisterRequestToJson(this);
}
