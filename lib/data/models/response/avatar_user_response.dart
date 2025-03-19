import 'package:json_annotation/json_annotation.dart';

part 'avatar_user_response.g.dart';

@JsonSerializable()
class AvatarUserResponse {
  String id;
  String avatar;
  bool isLock;
  AvatarUserResponse({this.id = '', this.avatar = '', this.isLock = true});

  factory AvatarUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AvatarUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarUserResponseToJson(this);
}
