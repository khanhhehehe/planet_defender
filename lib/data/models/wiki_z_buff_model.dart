import 'package:planet_defender/data/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wiki_z_buff_model.g.dart';

@JsonSerializable()
class WikiZBuffModel {
  final String name;
  final String description;
  final String usage;
  final String code;
  final String filePath;
  final bool isActive;
  final bool isOwned;
  final String id;
  final String createdUserId;
  final String updatedUserId;
  final String createdFullName;
  final String updatedFullName;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? createdDate;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? updatedDate;

  const WikiZBuffModel(
      {this.name = '',
      this.description = '',
      this.usage = '',
      this.code = '',
      this.filePath = '',
      this.isActive = false,
      this.isOwned = false,
      this.id = '',
      this.createdUserId = '',
      this.updatedUserId = '',
      this.createdFullName = '',
      this.updatedFullName = '',
      this.createdDate,
      this.updatedDate});

  factory WikiZBuffModel.fromJson(Map<String, dynamic> json) =>
      _$WikiZBuffModelFromJson(json);
  Map<String, dynamic> toJson() => _$WikiZBuffModelToJson(this);
}
