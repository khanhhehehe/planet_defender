// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zbuffs_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZBuffsType _$ZBuffsTypeFromJson(Map<String, dynamic> json) => ZBuffsType(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      usage: json['usage'] as String? ?? '',
      code: json['code'] as String? ?? '',
      filePath: json['filePath'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
      isOwned: json['isOwned'] as bool? ?? false,
      createdUserId: json['createdUserId'] as String? ?? '',
      updatedUserId: json['updatedUserId'] as String? ?? '',
      createdFullName: json['createdFullName'] as String? ?? '',
      updatedFullName: json['updatedFullName'] as String? ?? '',
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
    );

Map<String, dynamic> _$ZBuffsTypeToJson(ZBuffsType instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'description': instance.description,
    'usage': instance.usage,
    'code': instance.code,
    'filePath': instance.filePath,
    'isActive': instance.isActive,
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
