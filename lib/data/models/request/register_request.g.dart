// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterRequestCWProxy {
  RegisterRequest email(String email);

  RegisterRequest fullName(String fullName);

  RegisterRequest numberPhone(String numberPhone);

  RegisterRequest password(String password);

  RegisterRequest platformCode(String platformCode);

  RegisterRequest referralCode(String referralCode);

  RegisterRequest role(String role);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterRequest call({
    String? email,
    String? fullName,
    String? numberPhone,
    String? password,
    String? platformCode,
    String? referralCode,
    String? role,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRegisterRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRegisterRequest.copyWith.fieldName(...)`
class _$RegisterRequestCWProxyImpl implements _$RegisterRequestCWProxy {
  final RegisterRequest _value;

  const _$RegisterRequestCWProxyImpl(this._value);

  @override
  RegisterRequest email(String email) => this(email: email);

  @override
  RegisterRequest fullName(String fullName) => this(fullName: fullName);

  @override
  RegisterRequest numberPhone(String numberPhone) =>
      this(numberPhone: numberPhone);

  @override
  RegisterRequest password(String password) => this(password: password);

  @override
  RegisterRequest platformCode(String platformCode) =>
      this(platformCode: platformCode);

  @override
  RegisterRequest referralCode(String referralCode) =>
      this(referralCode: referralCode);

  @override
  RegisterRequest role(String role) => this(role: role);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? fullName = const $CopyWithPlaceholder(),
    Object? numberPhone = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? platformCode = const $CopyWithPlaceholder(),
    Object? referralCode = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
  }) {
    return RegisterRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      fullName: fullName == const $CopyWithPlaceholder() || fullName == null
          ? _value.fullName
          // ignore: cast_nullable_to_non_nullable
          : fullName as String,
      numberPhone:
          numberPhone == const $CopyWithPlaceholder() || numberPhone == null
              ? _value.numberPhone
              // ignore: cast_nullable_to_non_nullable
              : numberPhone as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      platformCode:
          platformCode == const $CopyWithPlaceholder() || platformCode == null
              ? _value.platformCode
              // ignore: cast_nullable_to_non_nullable
              : platformCode as String,
      referralCode:
          referralCode == const $CopyWithPlaceholder() || referralCode == null
              ? _value.referralCode
              // ignore: cast_nullable_to_non_nullable
              : referralCode as String,
      role: role == const $CopyWithPlaceholder() || role == null
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as String,
    );
  }
}

extension $RegisterRequestCopyWith on RegisterRequest {
  /// Returns a callable class that can be used as follows: `instanceOfRegisterRequest.copyWith(...)` or like so:`instanceOfRegisterRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterRequestCWProxy get copyWith => _$RegisterRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      fullName: json['fullName'] as String? ?? '',
      referralCode: json['referralCode'] as String? ?? '',
      password: json['password'] as String? ?? '',
      email: json['email'] as String? ?? '',
      numberPhone: json['phoneNumber'] as String? ?? '',
      role: json['role'] as String? ?? '',
      platformCode: json['platformCode'] as String? ?? '',
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'password': instance.password,
      'email': instance.email,
      'phoneNumber': instance.numberPhone,
      'referralCode': instance.referralCode,
      'role': instance.role,
      'platformCode': instance.platformCode,
    };
