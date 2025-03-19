// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      image: json['image'] as String? ?? '',
      isDefault: json['isDefault'] as bool? ?? false,
      isOwned: json['isOwned'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      id: json['id'] as String? ?? '',
      createdUserId: json['createdUserId'] as String? ?? '',
      updatedUserId: json['updatedUserId'] as String? ?? '',
      createdFullName: json['createdFullName'] as String? ?? '',
      updatedFullName: json['updatedFullName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      createdDate: BaseModel.dateFromJson(json['createdDate'] as String?),
      updatedDate: BaseModel.dateFromJson(json['updatedDate'] as String?),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) {
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
