import 'package:planet_defender/domain/entities/character.dart';

class CharacterUseCaseData {
  final List<String> characterIds;
  final Map<String, Character> characters;

  const CharacterUseCaseData({
    this.characterIds = const [],
    this.characters = const {},
  });
}
