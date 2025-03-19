import 'dart:async';

import 'package:planet_defender/presentations/bloc/key_board/keyboard_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'keyboard_event.dart';

@lazySingleton
class KeyboardBloc extends Bloc<KeyboardEvent, KeyboardState> {
  KeyboardBloc() : super(KeyboardInitial()) {
    on<ChangeValueKeyboard>(_changeValueKeyBoard);
  }
  Future<void> _changeValueKeyBoard(
      ChangeValueKeyboard event, Emitter<KeyboardState> emit) async {
    emit(state.copyWith(value: event.value));
  }
}
