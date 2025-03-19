// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      courseLevel: json['courseLevel'] as String? ?? "",
      studentId: json['studentId'] as String? ?? "",
      nickName: json['nickName'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      level: json['level'] as int? ?? 0,
      avatarImageId: json['avatarImageId'] as String? ?? "",
      tagNameId: json['tagNameId'] as String? ?? "",
      tagName: json['tagName'] as String? ?? "",
      highestRoundNumber: json['highestRoundNumber'] as int? ?? 0,
      highestScore: json['highestScore'] as int? ?? 0,
      id: json['id'] as String? ?? "",
      createdUserId: json['createdUserId'] as String? ?? "",
      updatedUserId: json['updatedUserId'] as String? ?? "",
      createdFullName: json['createdFullName'] as String? ?? "",
      updatedFullName: json['updatedFullName'] as String? ?? "",
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'courseLevel': instance.courseLevel,
    'studentId': instance.studentId,
    'nickName': instance.nickName,
    'gender': instance.gender,
    'level': instance.level,
    'avatarImageId': instance.avatarImageId,
    'tagNameId': instance.tagNameId,
    'tagName': instance.tagName,
    'highestRoundNumber': instance.highestRoundNumber,
    'highestScore': instance.highestScore,
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
