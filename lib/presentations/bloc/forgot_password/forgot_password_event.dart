part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
  @override
  List<Object> get props => [];
}

class RequestForgotPassword extends ForgotPasswordEvent {
  final String username;
  const RequestForgotPassword({
    required this.username,
  });

  @override
  List<Object> get props => [username];
}

class SetNewPassword extends ForgotPasswordEvent {
  final String password;
  const SetNewPassword({
    required this.password,
  });

  @override
  List<Object> get props => [password];
}

class ConfirmForgotPassword extends ForgotPasswordEvent {
  final String otp;
  const ConfirmForgotPassword({
    required this.otp,
  });

  @override
  List<Object> get props => [otp];
}
