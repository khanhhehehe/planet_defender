import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/data/models/enums/questions_type.dart';
import 'package:planet_defender/data/models/questions_type.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/meteorite/wiki_meteorite_state.dart';

part 'wiki_meteorite_event.dart';

@lazySingleton
class WikiMeteoriteBloc extends Bloc<WikiMeteoriteEvent, WikiMeteoriteState> {
  WikiMeteoriteBloc() : super(const WikiMeteoriteState()) {
    on<GetWikiMeteorite>(_getMeteorite);
  }

  FutureOr<void> _getMeteorite(
      GetWikiMeteorite event, Emitter<WikiMeteoriteState> emit) {
    emit(state.copyWith(meteorites: _getMeteorites(questionsType)));
  }
}

Map<QuestionsType, QuestionsTypeModel> _getMeteorites(
        List<QuestionsTypeModel> list) =>
    {
      for (var element in list)
        element.type: QuestionsTypeModel(
            description: element.description,
            image: element.image,
            hint: element.hint,
            type: element.type),
    };
