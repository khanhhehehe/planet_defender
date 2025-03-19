import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/data/models/base_model.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
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

  const Character(
      {this.image = '',
      this.isDefault = false,
      this.isOwned = false,
      this.name = '',
      this.code = '',
      this.price = 0,
      this.id = '',
      this.createdUserId = '',
      this.updatedUserId = '',
      this.createdFullName = '',
      this.updatedFullName = '',
      this.description = '',
      this.createdDate,
      this.updatedDate});

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
