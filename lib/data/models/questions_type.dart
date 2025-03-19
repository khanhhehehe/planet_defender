import 'package:planet_defender/data/models/enums/questions_type.dart';

class QuestionsTypeModel {
  final QuestionsType type;
  final String image;
  final String description;
  final String hint;
  const QuestionsTypeModel({
    this.type = QuestionsType.unknown,
    this.description = '',
    this.image = '',
    this.hint = '',
  });
}

List<QuestionsTypeModel> questionsType = [
  QuestionsTypeModel(
      type: QuestionsType.audio,
      description:
          'Lorem ipsum dolor sit amet consectetur. Amet turpis id ultrices et nulla. Volutpat faucibus tellus cras dictum euismod maecenas. Integer amet nisl urna nec vulputate sed faucibus odio.',
      hint:
          '“Lorem ipsum dolor sit amet consectetur. Amet turpis id ultrices et nulla. Volutpat faucibus tellus cras dictum euismod maecenas. Integer amet nisl urna nec vulputate sed faucibus odio.”',
      image: QuestionsType.audio.pathImage),
  QuestionsTypeModel(
      type: QuestionsType.definition,
      description:
          'Lorem ipsum dolor sit amet consectetur. Amet turpis id ultrices et nulla. Volutpat faucibus tellus cras dictum euismod maecenas. Integer amet nisl urna nec vulputate sed faucibus odio.',
      hint:
          '“Lorem ipsum dolor sit amet consectetur. Amet turpis id ultrices et nulla. Volutpat faucibus tellus cras dictum euismod maecenas. Integer amet nisl urna nec vulputate sed faucibus odio.”',
      image: QuestionsType.definition.pathImage),
  QuestionsTypeModel(
      type: QuestionsType.hint,
      description:
          'Lorem ipsum dolor sit amet consectetur. Amet turpis id ultrices et nulla. Volutpat faucibus tellus cras dictum euismod maecenas. Integer amet nisl urna nec vulputate sed faucibus odio.',
      hint:
          '“Lorem ipsum dolor sit amet consectetur. Amet turpis id ultrices et nulla. Volutpat faucibus tellus cras dictum euismod maecenas. Integer amet nisl urna nec vulputate sed faucibus odio.”',
      image: QuestionsType.hint.pathImage),
  QuestionsTypeModel(
      type: QuestionsType.image,
      description:
          'Lorem ipsum dolor sit amet consectetur. Amet turpis id ultrices et nulla. Volutpat faucibus tellus cras dictum euismod maecenas. Integer amet nisl urna nec vulputate sed faucibus odio.',
      hint:
          '“Lorem ipsum dolor sit amet consectetur. Amet turpis id ultrices et nulla. Volutpat faucibus tellus cras dictum euismod maecenas. Integer amet nisl urna nec vulputate sed faucibus odio.”',
      image: QuestionsType.image.pathImage),
  QuestionsTypeModel(
      type: QuestionsType.jumbledSpelling,
      description:
          'Lorem ipsum dolor sit amet consectetur. Amet turpis id ultrices et nulla. Volutpat faucibus tellus cras dictum euismod maecenas. Integer amet nisl urna nec vulputate sed faucibus odio.',
      hint:
          '“Lorem ipsum dolor sit amet consectetur. Amet turpis id ultrices et nulla. Volutpat faucibus tellus cras dictum euismod maecenas. Integer amet nisl urna nec vulputate sed faucibus odio.”',
      image: QuestionsType.jumbledSpelling.pathImage),
];
