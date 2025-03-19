import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/data/models/base_model.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final bool isDefault;
  final String image;
  final String name;
  final String code;
  final int price;
  final String description;
  final String id;
  final bool isOwned;
  final String createdUserId;
  final String updatedUserId;
  final String createdFullName;
  final String updatedFullName;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? createdDate;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? updatedDate;
  const CharacterModel({
    this.isDefault = false,
    this.image = '',
    this.name = '',
    this.price = 0,
    this.code = '',
    this.id = '',
    this.description = '',
    this.isOwned = false,
    this.createdUserId = '',
    this.updatedUserId = '',
    this.createdFullName = '',
    this.updatedFullName = '',
    this.createdDate,
    this.updatedDate,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
