import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/domain/use_cases/wiki_spaceship_usecase.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/space_ship/wiki_spaceship_state.dart';

part 'wiki_spaceship_event.dart';

@lazySingleton
class WikiSpaceshipsBloc
    extends HydratedBloc<WikiSpaceshipsEvent, WikiSpaceshipState> {
  final WikiSpaceshipUseCase _spaceShipUseCase;
  WikiSpaceshipsBloc()
      : _spaceShipUseCase = dI<WikiSpaceshipUseCase>(),
        super(const WikiSpaceshipState()) {
    on<GetWikiSpaceships>(_getSpaceships);
  }
  Future<FutureOr<void>> _getSpaceships(
      GetWikiSpaceships event, Emitter<WikiSpaceshipState> emit) async {
    try {
      emit(state.copyWith(status: WikiSpaceshipStatus.start));
      final result = await _spaceShipUseCase.getSpaceships();
      emit(state.copyWith(
          spaceShips: result.spaceShips,
          spaceShipIds: result.spaceShipIds,
          status: WikiSpaceshipStatus.success));
    } catch (e) {
      emit(state.copyWith(status: WikiSpaceshipStatus.error));
    }
  }

  @override
  WikiSpaceshipState? fromJson(Map<String, dynamic> json) {
    return WikiSpaceshipState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(WikiSpaceshipState state) {
    return state.toJson();
  }
}
