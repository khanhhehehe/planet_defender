// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_screens_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthScreensStateCWProxy {
  AuthScreensState status(AuthenticationScreensType status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthScreensState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthScreensState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthScreensState call({
    AuthenticationScreensType? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthScreensState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthScreensState.copyWith.fieldName(...)`
class _$AuthScreensStateCWProxyImpl implements _$AuthScreensStateCWProxy {
  final AuthScreensState _value;

  const _$AuthScreensStateCWProxyImpl(this._value);

  @override
  AuthScreensState status(AuthenticationScreensType status) =>
      this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthScreensState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthScreensState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthScreensState call({
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return AuthScreensState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AuthenticationScreensType,
    );
  }
}

extension $AuthScreensStateCopyWith on AuthScreensState {
  /// Returns a callable class that can be used as follows: `instanceOfAuthScreensState.copyWith(...)` or like so:`instanceOfAuthScreensState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthScreensStateCWProxy get copyWith => _$AuthScreensStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthScreensState _$AuthScreensStateFromJson(Map<String, dynamic> json) =>
    AuthScreensState(
      status: $enumDecodeNullable(
              _$AuthenticationScreensTypeEnumMap, json['status']) ??
          AuthenticationScreensType.login,
    );

Map<String, dynamic> _$AuthScreensStateToJson(AuthScreensState instance) =>
    <String, dynamic>{
      'status': _$AuthenticationScreensTypeEnumMap[instance.status]!,
    };

const _$AuthenticationScreensTypeEnumMap = {
  AuthenticationScreensType.register: 'register',
  AuthenticationScreensType.login: 'login',
  AuthenticationScreensType.forgotPassword: 'forgotPassword',
  AuthenticationScreensType.registerOtp: 'registerOtp',
  AuthenticationScreensType.registerDateOfBirth: 'registerDateOfBirth',
  AuthenticationScreensType.registerGender: 'registerGender',
  AuthenticationScreensType.registerReferralCode: 'registerReferralCode',
  AuthenticationScreensType.registerSuccessful: 'registerSuccessful',
  AuthenticationScreensType.forgotPasswordSuccessful:
      'forgotPasswordSuccessful',
  AuthenticationScreensType.recoverPasswordOtp: 'recoverPasswordOtp',
  AuthenticationScreensType.recoverPasswordNew: 'recoverPasswordNew',
};
