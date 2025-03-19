// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spaceships_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceshipsResponse _$SpaceshipsResponseFromJson(Map<String, dynamic> json) =>
    SpaceshipsResponse(
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => SpaceshipModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SpaceshipsResponseToJson(SpaceshipsResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
