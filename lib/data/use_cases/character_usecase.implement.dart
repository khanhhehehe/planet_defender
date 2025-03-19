import 'package:injectable/injectable.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/character_model.dart';
import 'package:planet_defender/data/models/use_case/character_data.dart';
import 'package:planet_defender/domain/entities/character.dart';
import 'package:planet_defender/domain/repositories/character.repository.dart';
import 'package:planet_defender/domain/use_cases/character_usecase.dart';
import 'package:planet_defender/gen/assets.gen.dart';

@LazySingleton(as: CharacterUseCase)
class CharacterUseCaseImpl extends CharacterUseCase {
  final CharacterRepository _repository;
  CharacterUseCaseImpl() : _repository = dI<CharacterRepository>();
  @override
  Future<CharacterUseCaseData> getCharacters() async {
    final characters = await _repository.getCharacters();
    return CharacterUseCaseData(
        characterIds: _getCharacterIds(characters),
        characters: _getCharacters(characters));
  }

  Map<String, Character> _getCharacters(List<CharacterModel> list) {
    Map<String, Character> characterMap = {};

    for (var element in list) {
      if (!element.isOwned) {
        characterMap[element.id] = Character(
          id: element.id,
          code: element.code,
          createdDate: element.createdDate,
          createdFullName: element.createdFullName,
          createdUserId: element.createdUserId,
          description: element.description,
          image: characterImage(image: element.image),
          isDefault: element.isDefault,
          isOwned: element.isOwned,
          name: element.name,
          price: element.price,
          updatedDate: element.updatedDate,
          updatedFullName: element.updatedFullName,
          updatedUserId: element.updatedUserId,
        );
      }
    }

    return characterMap;
  }

  List<String> _getCharacterIds(List<CharacterModel> list) {
    List<String> characterIds = List.empty(growable: true);
    for (var element in list) {
      if (!element.isOwned) {
        characterIds.add(element.id);
      }
    }
    return characterIds;
  }

  @override
  Future<void> buyCharacter({required String characterId}) async {
    await _repository.buyCharacter(characterId: characterId);
  }

  String characterImage({required String image}) {
    return image == '' ? Assets.images.character.path : image;
  }
}
