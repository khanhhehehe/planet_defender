part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthenticated extends AuthEvent {
  const CheckAuthenticated();
}

class Logout extends AuthEvent {
  const Logout();
}
