import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/data/models/character_model.dart';

part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse {
  List<CharacterModel> items;
  CharactersResponse({
    this.items = const [],
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}
