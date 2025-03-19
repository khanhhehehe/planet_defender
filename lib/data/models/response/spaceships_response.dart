import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/data/models/spaceship_model.dart';

part 'spaceships_response.g.dart';

@JsonSerializable()
class SpaceshipsResponse {
  List<SpaceshipModel> result;
  SpaceshipsResponse({
    this.result = const [],
  });

  factory SpaceshipsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpaceshipsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceshipsResponseToJson(this);
}
