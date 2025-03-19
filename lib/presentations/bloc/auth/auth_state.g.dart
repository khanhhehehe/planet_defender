// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthState _$AuthStateFromJson(Map<String, dynamic> json) => AuthState(
      status: $enumDecode(_$AuthStatusEnumMap, json['status']),
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
      'status': _$AuthStatusEnumMap[instance.status]!,
      'token': instance.token,
    };

const _$AuthStatusEnumMap = {
  AuthStatus.authInitial: 'authInitial',
  AuthStatus.loading: 'loading',
  AuthStatus.loggedIn: 'loggedIn',
  AuthStatus.loggedOut: 'loggedOut',
  AuthStatus.loginFail: 'loginFail',
  AuthStatus.unauthentication: 'unauthentication',
};
