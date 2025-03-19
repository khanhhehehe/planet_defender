// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spaceship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceshipModel _$SpaceshipModelFromJson(Map<String, dynamic> json) =>
    SpaceshipModel(
      isDefault: json['isDefault'] as bool? ?? false,
      image: json['image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      isOwned: json['isOwned'] as bool? ?? false,
      id: json['id'] as String? ?? '',
      createdUserId: json['createdUserId'] as String? ?? '',
      updatedUserId: json['updatedUserId'] as String? ?? '',
      createdFullName: json['createdFullName'] as String? ?? '',
      updatedFullName: json['updatedFullName'] as String? ?? '',
      createdDate: BaseModel.dateFromJson(json['createdDate'] as String?),
      updatedDate: BaseModel.dateFromJson(json['updatedDate'] as String?),
    );

Map<String, dynamic> _$SpaceshipModelToJson(SpaceshipModel instance) {
  final val = <String, dynamic>{
    'isDefault': instance.isDefault,
    'image': instance.image,
    'code': instance.code,
    'price': instance.price,
    'name': instance.name,
    'description': instance.description,
    'isOwned': instance.isOwned,
    'id': instance.id,
    'createdUserId': instance.createdUserId,
    'updatedUserId': instance.updatedUserId,
    'createdFullName': instance.createdFullName,
    'updatedFullName': instance.updatedFullName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdDate', instance.createdDate?.toIso8601String());
  writeNotNull('updatedDate', instance.updatedDate?.toIso8601String());
  return val;
}
