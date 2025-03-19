import 'dart:async';

import 'package:planet_defender/data/models/enums/fire_status.dart';
import 'package:planet_defender/presentations/bloc/game_play/fire_bloc/fire_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'fire_event.dart';

@lazySingleton
class FireBloc extends Bloc<FireEvent, FireState> {
  FireBloc() : super(FireInitial()) {
    on<InitFire>(_initFire);
    on<Fire>(_fire);
  }

  FutureOr<void> _initFire(InitFire event, Emitter<FireState> emit) async {
    emit(state.copyWith(fireStatus: FireStatus.none));
  }

  FutureOr<void> _fire(Fire event, Emitter<FireState> emit) async {
    emit(state.copyWith(fireStatus: event.status));
  }
}
