part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
  @override
  List<Object> get props => [];
}

class RequestChangePassword extends ChangePasswordEvent {
  final String currentPassword;
  final String newPassword;
  const RequestChangePassword(
      {this.currentPassword = '', this.newPassword = ''});
  @override
  List<Object> get props => [currentPassword, newPassword];
}
