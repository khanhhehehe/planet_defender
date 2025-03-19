import 'dart:async';

import 'package:planet_defender/presentations/bloc/countdown_time/countdown_time_state.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'countdown_time_event.dart';

@lazySingleton
class CountdownTimeBloc extends Bloc<CountdownTimeEvent, CountdownTimeState> {
  CountdownTimeBloc() : super(const CountdownTimeState()) {
    on<CountTime>(_onCountTime);
    on<SetExecutionTime>(_setExecutionTime);
  }
  FutureOr<void> _onCountTime(
      CountTime event, Emitter<CountdownTimeState> emit) async {
    try {
      emit(state.copyWith(countTimeStatus: StandaloneStatus.start));
      if (state.executionTime != null) {
        int executionTime = state.executionTime!;
        if (executionTime > 0) {
          executionTime = executionTime - 1;
          emit(state.copyWith(
              countTimeStatus: StandaloneStatus.success,
              executionTime: executionTime));
        } else if (executionTime == 0) {
          emit(state.copyWith(countTimeStatus: StandaloneStatus.fail));
        }
      }
    } catch (e) {
      emit(state.copyWith(countTimeStatus: StandaloneStatus.fail));
    }
  }

  FutureOr<void> _setExecutionTime(
      SetExecutionTime event, Emitter<CountdownTimeState> emit) async {
    emit(state.copyWith(executionTime: event.seconds));
  }
}
