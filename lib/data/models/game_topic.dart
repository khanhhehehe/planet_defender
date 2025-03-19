import 'package:json_annotation/json_annotation.dart';

part 'game_topic.g.dart';

@JsonSerializable()
class GameTopic {
  final String id;
  final String createdUserId;
  final String updatedUserId;
  final String createdFullName;
  final String updatedFullName;
  final String createdDate;
  final String updatedDate;
  final String unitOrder;
  final String value;
  final String skill;
  final String courseLevel;

  const GameTopic({
    this.id = "",
    this.createdUserId = "",
    this.updatedUserId = "",
    this.createdFullName = "",
    this.updatedFullName = "",
    this.createdDate = "",
    this.updatedDate = "",
    this.unitOrder = "",
    this.value = "",
    this.skill = "",
    this.courseLevel = "",
  });

  factory GameTopic.fromJson(Map<String, dynamic> json) =>
      _$GameTopicFromJson(json);
  Map<String, dynamic> toJson() => _$GameTopicToJson(this);
}
