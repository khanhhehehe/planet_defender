import 'dart:math' as math;

import 'package:planet_defender/common/constants/meteorite_type.dart';
import 'package:planet_defender/data/models/questions_model.dart';
import 'package:planet_defender/gen/assets.gen.dart';

double currentX = 0;

class MeteoriteUtils {
  double getDistanceMeteorites({int? index}) {
    final random = math.Random();
    for (var i = 0; i > -1;) {
      double nextX =
          listDistanceMeteorite[random.nextInt(listDistanceMeteorite.length)];
      if (currentX != nextX) {
        currentX = nextX;
        return nextX;
      }
    }
    return 0;
  }

  String getGameVocabTypePath(GameVocabularyType type) {
    switch (type) {
      case GameVocabularyType.audio:
        return Assets.images.sound.path;
      case GameVocabularyType.hint:
        return Assets.images.word.path;
      case GameVocabularyType.image:
        return Assets.images.image.path;
      case GameVocabularyType.jumbledSpelling:
        return Assets.images.jumbled.path;
      case GameVocabularyType.definition:
        return Assets.images.suggestion.path;
      default:
        return "";
    }
  }

  String getTitleGameVocabTypePath(GameVocabularyType type) {
    switch (type) {
      case GameVocabularyType.audio:
        return Assets.images.titleAudio.path;
      case GameVocabularyType.hint:
        return Assets.images.titleHint.path;
      case GameVocabularyType.image:
        return Assets.images.titleImage.path;
      case GameVocabularyType.jumbledSpelling:
        return Assets.images.titleJumbledSpelling.path;
      case GameVocabularyType.definition:
        return Assets.images.titleDefinition.path;
      default:
        return "";
    }
  }
}
