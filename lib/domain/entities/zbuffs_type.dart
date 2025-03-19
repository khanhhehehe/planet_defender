import 'package:json_annotation/json_annotation.dart';

part 'zbuffs_type.g.dart';

@JsonSerializable()
class ZBuffsType {
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
  final DateTime? createdDate;
  final DateTime? updatedDate;

  const ZBuffsType({
    this.id = '',
    this.name = '',
    this.description = '',
    this.usage = '',
    this.code = '',
    this.filePath = '',
    this.isActive = false,
    this.isOwned = false,
    this.createdUserId = '',
    this.updatedUserId = '',
    this.createdFullName = '',
    this.updatedFullName = '',
    this.createdDate,
    this.updatedDate,
  });

  factory ZBuffsType.fromJson(Map<String, dynamic> json) =>
      _$ZBuffsTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ZBuffsTypeToJson(this);
}
