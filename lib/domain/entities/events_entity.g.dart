// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventsEntity _$EventsEntityFromJson(Map<String, dynamic> json) => EventsEntity(
      id: json['id'] as String? ?? '',
      createdUserId: json['createdUserId'] as String? ?? '',
      updatedUserId: json['updatedUserId'] as String? ?? '',
      createdFullName: json['createdFullName'] as String? ?? '',
      updatedFullName: json['updatedFullName'] as String? ?? '',
      title: json['title'] as String? ?? '',
      startDate: BaseModel.dateFromJson(json['startDate'] as String?),
      status: json['status'] as bool? ?? false,
      description: json['description'] as String? ?? '',
      filePath: json['filePath'] as String? ?? '',
      type: json['type'] as String? ?? '',
      createdDate: BaseModel.dateFromJson(json['createdDate'] as String?),
      updatedDate: BaseModel.dateFromJson(json['updatedDate'] as String?),
    );

Map<String, dynamic> _$EventsEntityToJson(EventsEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'createdUserId': instance.createdUserId,
    'updatedUserId': instance.updatedUserId,
    'createdFullName': instance.createdFullName,
    'updatedFullName': instance.updatedFullName,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startDate', instance.startDate?.toIso8601String());
  val['status'] = instance.status;
  val['description'] = instance.description;
  val['filePath'] = instance.filePath;
  val['type'] = instance.type;
  writeNotNull('createdDate', instance.createdDate?.toIso8601String());
  writeNotNull('updatedDate', instance.updatedDate?.toIso8601String());
  return val;
}
