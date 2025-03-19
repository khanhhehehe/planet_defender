import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:planet_defender/data/models/enums/questions_type.dart';
import 'package:planet_defender/data/models/questions_type.dart';

part 'wiki_meteorite_state.g.dart';

@CopyWith()
class WikiMeteoriteState extends Equatable {
  final Map<QuestionsType, QuestionsTypeModel> meteorites;
  const WikiMeteoriteState({
    this.meteorites = const {},
  });

  @override
  List<Object> get props => [meteorites];
}
