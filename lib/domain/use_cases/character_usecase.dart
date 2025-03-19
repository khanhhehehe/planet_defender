import 'package:planet_defender/data/models/use_case/character_data.dart';

abstract class CharacterUseCase {
  Future<CharacterUseCaseData> getCharacters();
  Future<void> buyCharacter({required String characterId});
}