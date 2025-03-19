import 'package:planet_defender/data/models/character_model.dart';
abstract class CharacterService {
  Future<List<CharacterModel>> getCharacters();
  Future<void> buyCharacter({required String characterId});
}