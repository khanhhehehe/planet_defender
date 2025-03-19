// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      isDefault: json['isDefault'] as bool? ?? false,
      image: json['image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      id: json['id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      isOwned: json['isOwned'] as bool? ?? false,
      createdUserId: json['createdUserId'] as String? ?? '',
      updatedUserId: json['updatedUserId'] as String? ?? '',
      createdFullName: json['createdFullName'] as String? ?? '',
      updatedFullName: json['updatedFullName'] as String? ?? '',
      createdDate: BaseModel.dateFromJson(json['createdDate'] as String?),
      updatedDate: BaseModel.dateFromJson(json['updatedDate'] as String?),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) {
  final val = <String, dynamic>{
    'isDefault': instance.isDefault,
    'image': instance.image,
    'name': instance.name,
    'code': instance.code,
    'price': instance.price,
    'description': instance.description,
    'id': instance.id,
    'isOwned': instance.isOwned,
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
