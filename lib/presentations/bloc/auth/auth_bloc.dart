import 'dart:async';

import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/presentations/bloc/auth/auth_state.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';

@lazySingleton
class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState(status: AuthStatus.authInitial)) {
    on<AuthEvent>((event, emit) {});
    on<CheckAuthenticated>(_checkAuthenticated);
    on<Logout>(_logOut);
  }

  FutureOr<void> _checkAuthenticated(event, emit) async {
    String userToken = await AppLocalStorage.getData(DataKey.token) ?? "";
    try {
      if (userToken.isNotEmpty) {
        AppConfig.setToken(userToken);
        emit(AuthState(status: AuthStatus.loggedIn, token: userToken));
      } else {
        emit(const AuthState(status: AuthStatus.unauthentication));
      }
    } catch (e) {
      emit(const AuthState(status: AuthStatus.unauthentication));
    }
  }

  FutureOr<void> _logOut(Logout event, Emitter<AuthState> emit) async {
    emit(const AuthState(status: AuthStatus.unauthentication));
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}
