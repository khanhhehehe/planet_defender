import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthScreensCubit extends HydratedCubit<AuthScreensState> {
  AuthScreensCubit()
      : super(const AuthScreensState(status: AuthenticationScreensType.login));

  void changeStatus(AuthenticationScreensType status) async {
    emit(AuthScreensState(status: status));
  }

  @override
  AuthScreensState? fromJson(Map<String, dynamic> json) {
    return AuthScreensState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthScreensState state) {
    return state.toJson();
  }
}
