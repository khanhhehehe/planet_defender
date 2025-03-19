// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Characters _$CharactersFromJson(Map<String, dynamic> json) => Characters(
      characters: (json['characters'] as List<dynamic>?)
              ?.map((e) => SpaceshipModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CharactersToJson(Characters instance) =>
    <String, dynamic>{
      'characters': instance.characters,
    };
