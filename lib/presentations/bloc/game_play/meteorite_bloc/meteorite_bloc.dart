import 'dart:async';

import 'package:planet_defender/presentations/bloc/game_play/meteorite_bloc/meteorite_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'meteorite_event.dart';

@lazySingleton
class MeteoriteBloc extends Bloc<MeteoriteEvent, MeteoriteState> {
  MeteoriteBloc() : super(MeteoriteInitial()) {
    on<SelectMeteorite>(_selectMeteorite);
    on<Init>(_init);
  }

  FutureOr<void> _selectMeteorite(
      SelectMeteorite event, Emitter<MeteoriteState> emit) async {
    emit(state.copyWith(meteoriteSelected: event.index));
  }

  FutureOr<void> _init(Init event, Emitter<MeteoriteState> emit) async {
    emit(state.copyWith(meteoriteSelected: ''));
  }
}
