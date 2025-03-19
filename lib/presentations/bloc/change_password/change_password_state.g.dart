// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChangePasswordStateCWProxy {
  ChangePasswordState confirmPassword(String confirmPassword);

  ChangePasswordState currentPassword(String currentPassword);

  ChangePasswordState newPassword(String newPassword);

  ChangePasswordState status(ChangePasswordStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChangePasswordState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChangePasswordState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChangePasswordState call({
    String? confirmPassword,
    String? currentPassword,
    String? newPassword,
    ChangePasswordStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChangePasswordState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChangePasswordState.copyWith.fieldName(...)`
class _$ChangePasswordStateCWProxyImpl implements _$ChangePasswordStateCWProxy {
  final ChangePasswordState _value;

  const _$ChangePasswordStateCWProxyImpl(this._value);

  @override
  ChangePasswordState confirmPassword(String confirmPassword) =>
      this(confirmPassword: confirmPassword);

  @override
  ChangePasswordState currentPassword(String currentPassword) =>
      this(currentPassword: currentPassword);

  @override
  ChangePasswordState newPassword(String newPassword) =>
      this(newPassword: newPassword);

  @override
  ChangePasswordState status(ChangePasswordStatus status) =>
      this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChangePasswordState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChangePasswordState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChangePasswordState call({
    Object? confirmPassword = const $CopyWithPlaceholder(),
    Object? currentPassword = const $CopyWithPlaceholder(),
    Object? newPassword = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return ChangePasswordState(
      confirmPassword: confirmPassword == const $CopyWithPlaceholder() ||
              confirmPassword == null
          ? _value.confirmPassword
          // ignore: cast_nullable_to_non_nullable
          : confirmPassword as String,
      currentPassword: currentPassword == const $CopyWithPlaceholder() ||
              currentPassword == null
          ? _value.currentPassword
          // ignore: cast_nullable_to_non_nullable
          : currentPassword as String,
      newPassword:
          newPassword == const $CopyWithPlaceholder() || newPassword == null
              ? _value.newPassword
              // ignore: cast_nullable_to_non_nullable
              : newPassword as String,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ChangePasswordStatus,
    );
  }
}

extension $ChangePasswordStateCopyWith on ChangePasswordState {
  /// Returns a callable class that can be used as follows: `instanceOfChangePasswordState.copyWith(...)` or like so:`instanceOfChangePasswordState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChangePasswordStateCWProxy get copyWith =>
      _$ChangePasswordStateCWProxyImpl(this);
}
