import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/character_model.dart';
import 'package:planet_defender/domain/repositories/character.repository.dart';
import 'package:planet_defender/domain/services/character.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CharacterRepository)
class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterService _service;

  CharacterRepositoryImpl() : _service = dI<CharacterService>();

  @override
  Future<List<CharacterModel>> getCharacters() async {
    final characters = await _service.getCharacters();
    return characters;
  }
  
  
  @override
  Future<void> buyCharacter({required String characterId}) async {
    await _service.buyCharacter(characterId: characterId);
  }
}
