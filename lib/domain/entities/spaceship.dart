import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/data/models/base_model.dart';

part 'spaceship.g.dart';

@JsonSerializable()
class Spaceship {
  final bool isDefault;
  final String image;
  final String code;
  final int price;
  final String name;
  final String description;
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
  const Spaceship({
    this.isDefault = false,
    this.image = '',
    this.code = '',
    this.price = 0,
    this.name = '',
    this.description = '',
    this.isOwned = false,
    this.id = '',
    this.createdUserId = '',
    this.updatedUserId = '',
    this.createdFullName = '',
    this.updatedFullName = '',
    this.createdDate,
    this.updatedDate,
  });

  factory Spaceship.fromJson(Map<String, dynamic> json) =>
      _$SpaceshipFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceshipToJson(this);
}
