import 'package:json_annotation/json_annotation.dart';

part 'tag_user.g.dart';

@JsonSerializable()
class TagUser {
  String id;
  String title;
  bool isLock;
  TagUser(
      {this.id = '',
      this.title = '',
      this.isLock = true});

  factory TagUser.fromJson(Map<String, dynamic> json) =>
      _$TagUserFromJson(json);
  Map<String, dynamic> toJson() => _$TagUserToJson(this);
}
