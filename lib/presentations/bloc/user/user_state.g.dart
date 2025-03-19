// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserStateCWProxy {
  UserState levelStatus(CreateAcademicLevel levelStatus);

  UserState status(CreateNicknameStatus status);

  UserState userInfo(User userInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserState call({
    CreateAcademicLevel? levelStatus,
    CreateNicknameStatus? status,
    User? userInfo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserState.copyWith.fieldName(...)`
class _$UserStateCWProxyImpl implements _$UserStateCWProxy {
  final UserState _value;

  const _$UserStateCWProxyImpl(this._value);

  @override
  UserState levelStatus(CreateAcademicLevel levelStatus) =>
      this(levelStatus: levelStatus);

  @override
  UserState status(CreateNicknameStatus status) => this(status: status);

  @override
  UserState userInfo(User userInfo) => this(userInfo: userInfo);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserState call({
    Object? levelStatus = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? userInfo = const $CopyWithPlaceholder(),
  }) {
    return UserState(
      levelStatus:
          levelStatus == const $CopyWithPlaceholder() || levelStatus == null
              ? _value.levelStatus
              // ignore: cast_nullable_to_non_nullable
              : levelStatus as CreateAcademicLevel,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as CreateNicknameStatus,
      userInfo: userInfo == const $CopyWithPlaceholder() || userInfo == null
          ? _value.userInfo
          // ignore: cast_nullable_to_non_nullable
          : userInfo as User,
    );
  }
}

extension $UserStateCopyWith on UserState {
  /// Returns a callable class that can be used as follows: `instanceOfUserState.copyWith(...)` or like so:`instanceOfUserState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserStateCWProxy get copyWith => _$UserStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserState _$UserStateFromJson(Map<String, dynamic> json) => UserState(
      status:
          $enumDecodeNullable(_$CreateNicknameStatusEnumMap, json['status']) ??
              CreateNicknameStatus.failed,
      userInfo: json['userInfo'] == null
          ? const User()
          : User.fromJson(json['userInfo'] as Map<String, dynamic>),
      levelStatus: $enumDecodeNullable(
              _$CreateAcademicLevelEnumMap, json['levelStatus']) ??
          CreateAcademicLevel.failed,
    );

Map<String, dynamic> _$UserStateToJson(UserState instance) => <String, dynamic>{
      'userInfo': instance.userInfo,
      'status': _$CreateNicknameStatusEnumMap[instance.status]!,
      'levelStatus': _$CreateAcademicLevelEnumMap[instance.levelStatus]!,
    };

const _$CreateNicknameStatusEnumMap = {
  CreateNicknameStatus.success: 'success',
  CreateNicknameStatus.failed: 'failed',
};

const _$CreateAcademicLevelEnumMap = {
  CreateAcademicLevel.success: 'success',
  CreateAcademicLevel.failed: 'failed',
};
