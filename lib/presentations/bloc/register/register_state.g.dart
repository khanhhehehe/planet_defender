// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterStateCWProxy {
  RegisterState date(String date);

  RegisterState gender(String gender);

  RegisterState passWord(String passWord);

  RegisterState registerRequest(RegisterRequest? registerRequest);

  RegisterState status(RegisterStatus status);

  RegisterState userId(String userId);

  RegisterState userName(String userName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterState(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterState call({
    String? date,
    String? gender,
    String? passWord,
    RegisterRequest? registerRequest,
    RegisterStatus? status,
    String? userId,
    String? userName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRegisterState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRegisterState.copyWith.fieldName(...)`
class _$RegisterStateCWProxyImpl implements _$RegisterStateCWProxy {
  final RegisterState _value;

  const _$RegisterStateCWProxyImpl(this._value);

  @override
  RegisterState date(String date) => this(date: date);

  @override
  RegisterState gender(String gender) => this(gender: gender);

  @override
  RegisterState passWord(String passWord) => this(passWord: passWord);

  @override
  RegisterState registerRequest(RegisterRequest? registerRequest) =>
      this(registerRequest: registerRequest);

  @override
  RegisterState status(RegisterStatus status) => this(status: status);

  @override
  RegisterState userId(String userId) => this(userId: userId);

  @override
  RegisterState userName(String userName) => this(userName: userName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterState(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterState call({
    Object? date = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? passWord = const $CopyWithPlaceholder(),
    Object? registerRequest = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
  }) {
    return RegisterState(
      date: date == const $CopyWithPlaceholder() || date == null
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String,
      gender: gender == const $CopyWithPlaceholder() || gender == null
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as String,
      passWord: passWord == const $CopyWithPlaceholder() || passWord == null
          ? _value.passWord
          // ignore: cast_nullable_to_non_nullable
          : passWord as String,
      registerRequest: registerRequest == const $CopyWithPlaceholder()
          ? _value.registerRequest
          // ignore: cast_nullable_to_non_nullable
          : registerRequest as RegisterRequest?,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as RegisterStatus,
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
    );
  }
}

extension $RegisterStateCopyWith on RegisterState {
  /// Returns a callable class that can be used as follows: `instanceOfRegisterState.copyWith(...)` or like so:`instanceOfRegisterState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterStateCWProxy get copyWith => _$RegisterStateCWProxyImpl(this);
}
