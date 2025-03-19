import 'package:json_annotation/json_annotation.dart';

part 'avatar_user.g.dart';

@JsonSerializable()
class AvatarUser {
  String id;
  String avatar;
  bool isLock;
  AvatarUser({this.id = '', this.avatar = '', this.isLock = true});

  factory AvatarUser.fromJson(Map<String, dynamic> json) =>
      _$AvatarUserFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarUserToJson(this);
}
