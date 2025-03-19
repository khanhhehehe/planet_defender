import 'dart:async';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/domain/use_cases/forgot_password_usecase.dart';
import 'package:planet_defender/presentations/bloc/forgot_password/forgot_password_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'forgot_password_event.dart';

@lazySingleton
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  ForgotPasswordBloc()
      : _forgotPasswordUseCase = dI<ForgotPasswordUseCase>(),
        super(const ForgotPasswordState()) {
    on<RequestForgotPassword>(_requestForgotPassword);
    on<SetNewPassword>(_setNewPassword);
    on<ConfirmForgotPassword>(_confirmForgotPassword);
  }

  FutureOr<void> _requestForgotPassword(
      RequestForgotPassword event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(status: ForgotPasswordStatus.init));
    try {
      final isCheckEmail =
          await _forgotPasswordUseCase.forgotPassword(username: event.username);
      if (isCheckEmail) {
        emit(state.copyWith(status: ForgotPasswordStatus.success));
      } else {
        emit(state.copyWith(status: ForgotPasswordStatus.failed));
      }
    } catch (e) {
      emit(state.copyWith(status: ForgotPasswordStatus.failed));
    }
  }

  FutureOr<void> _setNewPassword(
      SetNewPassword event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(
        newPassword: event.password, status: ForgotPasswordStatus.init));
  }

  FutureOr<void> _confirmForgotPassword(
      ConfirmForgotPassword event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(status: ForgotPasswordStatus.init));
    try {
      final isCheck = await _forgotPasswordUseCase.forgotPasswordConfirmOtp(
        otp: event.otp,
        newPassword: state.newPassword,
      );
      if (isCheck) {
        emit(state.copyWith(status: ForgotPasswordStatus.success));
      } else {
        emit(state.copyWith(status: ForgotPasswordStatus.failed));
      }
    } catch (e) {
      emit(state.copyWith(status: ForgotPasswordStatus.failed));
    }
  }
}
