import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/data/models/base_model.dart';

part 'events_entity.g.dart';

@JsonSerializable()
class EventsEntity {
  const EventsEntity({
    this.id = '',
    this.createdUserId = '',
    this.updatedUserId = '',
    this.createdFullName = '',
    this.updatedFullName = '',
    this.title = '',
    this.startDate,
    this.status = false,
    this.description = '',
    this.filePath = '',
    this.type = '',
    this.createdDate,
    this.updatedDate,
  });

  final String id;
  final String createdUserId;
  final String updatedUserId;
  final String createdFullName;
  final String updatedFullName;
  final String title;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? startDate;
  final bool status;
  final String description;
  final String filePath;
  final String type;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? createdDate;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? updatedDate;

  factory EventsEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$EventsEntityToJson(this);
}
