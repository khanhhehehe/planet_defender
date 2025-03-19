// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meteorite_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMeteorite _$ItemMeteoriteFromJson(Map<String, dynamic> json) =>
    ItemMeteorite(
      id: json['id'] as String? ?? '',
      isEnable: json['isEnable'] as bool? ?? false,
      listQuestion: (json['listQuestion'] as List<dynamic>?)
              ?.map((e) => Meteorite.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ItemMeteoriteToJson(ItemMeteorite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listQuestion': instance.listQuestion,
      'isEnable': instance.isEnable,
    };
