// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spaceships.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spaceships _$SpaceshipsFromJson(Map<String, dynamic> json) => Spaceships(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Spaceship.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SpaceshipsToJson(Spaceships instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
