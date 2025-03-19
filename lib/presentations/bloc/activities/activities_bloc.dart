import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/domain/use_cases/activities_game.usecase.dart';
import 'package:planet_defender/presentations/bloc/activities/activities_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'activities_event.dart';

@lazySingleton
class ActivitiesBloc extends HydratedBloc<ActivitiesEvent, ActivitiesState> {
  final ActivitiesGameUseCase _activitiesGameUseCase;
  ActivitiesBloc()
      : _activitiesGameUseCase = dI<ActivitiesGameUseCase>(),
        super(const ActivitiesState()) {
    on<GetActivities>(_getActivities);
  }

  FutureOr<void> _getActivities(event, emit) async {
    try {
      emit(state.copyWith(activitiesGameStatus: ActivitiesGameStatus.start));
      final result = await _activitiesGameUseCase.getEvents();
      emit(state.copyWith(
          events: result.events,
          eventIds: result.eventIds,
          activitiesGameStatus: ActivitiesGameStatus.success));
    } catch (e) {
      emit(state.copyWith(activitiesGameStatus: ActivitiesGameStatus.error));
    }
  }

  @override
  ActivitiesState? fromJson(Map<String, dynamic> json) {
    return ActivitiesState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ActivitiesState state) {
    return state.toJson();
  }
}
