import 'package:json_annotation/json_annotation.dart';

part 'tag_user_response.g.dart';

@JsonSerializable()
class TagUserResponse {
  String id;
  String title;
  bool isLock;
  TagUserResponse(
      {this.id = '',
      this.title = '',
      this.isLock = true});

  factory TagUserResponse.fromJson(Map<String, dynamic> json) =>
      _$TagUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TagUserResponseToJson(this);
}
