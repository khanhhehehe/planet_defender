import 'package:planet_defender/gen/assets.gen.dart';

enum QuestionsType {
  unknown('unknown'),
  audio('Audio'),
  definition('Definition'),
  hint('Hint'),
  image('Image'),
  jumbledSpelling('Jumbled Spelling');

  final String name;
  const QuestionsType(this.name);
}

extension QuestionsTypeEx on QuestionsType {
  String get pathImage {
    switch (this) {
      case QuestionsType.audio:
        return Assets.images.audioWiki.path;
      case QuestionsType.definition:
        return Assets.images.definitionWiki.path;
      case QuestionsType.hint:
        return Assets.images.hintWiki.path;
      case QuestionsType.image:
        return Assets.images.imageWiki.path;
      case QuestionsType.jumbledSpelling:
        return Assets.images.jumbledSpellingWiki.path;
      default:
        return '';
    }
  }
}
