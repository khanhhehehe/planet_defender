import 'package:planet_defender/data/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
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
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? createdDate;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? updatedDate;

  const UserModel(
      {this.courseLevel = '',
      this.studentId = '',
      this.nickName = '',
      this.gender = '',
      this.level = 0,
      this.avatarImageId = '',
      this.tagNameId = '',
      this.tagName = '',
      this.highestRoundNumber = 0,
      this.highestScore = 0,
      this.id = '',
      this.createdUserId = '',
      this.updatedUserId = '',
      this.createdFullName = '',
      this.updatedFullName = '',
      this.createdDate,
      this.updatedDate});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
