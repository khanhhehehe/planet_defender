import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_state.g.dart';

enum AuthStatus {
  authInitial,
  loading,
  loggedIn,
  loggedOut,
  loginFail,
  unauthentication,
}

@JsonSerializable()
class AuthState extends Equatable {
  final AuthStatus status;
  final String token;
  const AuthState({
    required this.status,
    this.token = '',
  });

  @override
  List<Object> get props => [status, token];
  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
  Map<String, dynamic> toJson() => _$AuthStateToJson(this);
}
