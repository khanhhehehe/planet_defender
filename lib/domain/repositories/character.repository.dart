import 'package:planet_defender/data/models/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getCharacters();
  Future<void> buyCharacter({required String characterId});
}
