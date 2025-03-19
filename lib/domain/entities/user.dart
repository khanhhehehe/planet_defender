import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String courseLevel;
  final String studentId;
  final String nickName;
  final String gender;
  final int level;
  final String avatarImageId;
  final String tagNameId;
  final String tagName;
  final int highestRoundNumber;
  final int highestScore;
  final String id;
  final String createdUserId;
  final String updatedUserId;
  final String createdFullName;
  final String updatedFullName;
  final DateTime? createdDate;
  final DateTime? updatedDate;

  const User(
      {this.courseLevel = "",
      this.studentId = "",
      this.nickName = "",
      this.gender = "",
      this.level = 0,
      this.avatarImageId = "",
      this.tagNameId = "",
      this.tagName = "",
      this.highestRoundNumber = 0,
      this.highestScore = 0,
      this.id = "",
      this.createdUserId = "",
      this.updatedUserId = "",
      this.createdFullName = "",
      this.updatedFullName = "",
      this.createdDate,
      this.updatedDate});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
