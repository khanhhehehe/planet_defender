// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ForgotPasswordStateCWProxy {
  ForgotPasswordState newPassword(String newPassword);

  ForgotPasswordState status(ForgotPasswordStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ForgotPasswordState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ForgotPasswordState(...).copyWith(id: 12, name: "My name")
  /// ````
  ForgotPasswordState call({
    String? newPassword,
    ForgotPasswordStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfForgotPasswordState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfForgotPasswordState.copyWith.fieldName(...)`
class _$ForgotPasswordStateCWProxyImpl implements _$ForgotPasswordStateCWProxy {
  final ForgotPasswordState _value;

  const _$ForgotPasswordStateCWProxyImpl(this._value);

  @override
  ForgotPasswordState newPassword(String newPassword) =>
      this(newPassword: newPassword);

  @override
  ForgotPasswordState status(ForgotPasswordStatus status) =>
      this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ForgotPasswordState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ForgotPasswordState(...).copyWith(id: 12, name: "My name")
  /// ````
  ForgotPasswordState call({
    Object? newPassword = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return ForgotPasswordState(
      newPassword:
          newPassword == const $CopyWithPlaceholder() || newPassword == null
              ? _value.newPassword
              // ignore: cast_nullable_to_non_nullable
              : newPassword as String,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ForgotPasswordStatus,
    );
  }
}

extension $ForgotPasswordStateCopyWith on ForgotPasswordState {
  /// Returns a callable class that can be used as follows: `instanceOfForgotPasswordState.copyWith(...)` or like so:`instanceOfForgotPasswordState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ForgotPasswordStateCWProxy get copyWith =>
      _$ForgotPasswordStateCWProxyImpl(this);
}
