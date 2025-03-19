// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/data/models/spaceship_model.dart';

part 'characters.g.dart';

@JsonSerializable()
class Characters {
  List<SpaceshipModel> characters;
  Characters({
    this.characters = const [],
  });

  factory Characters.fromJson(Map<String, dynamic> json) =>
      _$CharactersFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}
