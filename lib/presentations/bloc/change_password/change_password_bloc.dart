import 'dart:async';

import 'package:planet_defender/presentations/bloc/change_password/change_password_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'change_password_event.dart';

@lazySingleton
class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePasswordState()) {
    on<RequestChangePassword>(_requestChangePassword);
  }

  FutureOr<void> _requestChangePassword(
      RequestChangePassword event, Emitter<ChangePasswordState> emit) {}
}
