// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CharacterStateCWProxy {
  CharacterState academicType(AcademicType academicType);

  CharacterState character(CharacterType character);

  CharacterState ieltsType(IeltsType ieltsType);

  CharacterState selectTabLevelType(SelectTabLevelType selectTabLevelType);

  CharacterState status(CharacterStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterState(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterState call({
    AcademicType? academicType,
    CharacterType? character,
    IeltsType? ieltsType,
    SelectTabLevelType? selectTabLevelType,
    CharacterStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCharacterState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCharacterState.copyWith.fieldName(...)`
class _$CharacterStateCWProxyImpl implements _$CharacterStateCWProxy {
  final CharacterState _value;

  const _$CharacterStateCWProxyImpl(this._value);

  @override
  CharacterState academicType(AcademicType academicType) =>
      this(academicType: academicType);

  @override
  CharacterState character(CharacterType character) =>
      this(character: character);

  @override
  CharacterState ieltsType(IeltsType ieltsType) => this(ieltsType: ieltsType);

  @override
  CharacterState selectTabLevelType(SelectTabLevelType selectTabLevelType) =>
      this(selectTabLevelType: selectTabLevelType);

  @override
  CharacterState status(CharacterStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterState(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterState call({
    Object? academicType = const $CopyWithPlaceholder(),
    Object? character = const $CopyWithPlaceholder(),
    Object? ieltsType = const $CopyWithPlaceholder(),
    Object? selectTabLevelType = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return CharacterState(
      academicType:
          academicType == const $CopyWithPlaceholder() || academicType == null
              ? _value.academicType
              // ignore: cast_nullable_to_non_nullable
              : academicType as AcademicType,
      character: character == const $CopyWithPlaceholder() || character == null
          ? _value.character
          // ignore: cast_nullable_to_non_nullable
          : character as CharacterType,
      ieltsType: ieltsType == const $CopyWithPlaceholder() || ieltsType == null
          ? _value.ieltsType
          // ignore: cast_nullable_to_non_nullable
          : ieltsType as IeltsType,
      selectTabLevelType: selectTabLevelType == const $CopyWithPlaceholder() ||
              selectTabLevelType == null
          ? _value.selectTabLevelType
          // ignore: cast_nullable_to_non_nullable
          : selectTabLevelType as SelectTabLevelType,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as CharacterStatus,
    );
  }
}

extension $CharacterStateCopyWith on CharacterState {
  /// Returns a callable class that can be used as follows: `instanceOfCharacterState.copyWith(...)` or like so:`instanceOfCharacterState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CharacterStateCWProxy get copyWith => _$CharacterStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterState _$CharacterStateFromJson(Map<String, dynamic> json) =>
    CharacterState(
      character:
          $enumDecodeNullable(_$CharacterTypeEnumMap, json['character']) ??
              CharacterType.unknown,
      academicType:
          $enumDecodeNullable(_$AcademicTypeEnumMap, json['academicType']) ??
              AcademicType.unknown,
      ieltsType: $enumDecodeNullable(_$IeltsTypeEnumMap, json['ieltsType']) ??
          IeltsType.unknown,
      selectTabLevelType: $enumDecodeNullable(
              _$SelectTabLevelTypeEnumMap, json['selectTabLevelType']) ??
          SelectTabLevelType.academic,
      status: $enumDecodeNullable(_$CharacterStatusEnumMap, json['status']) ??
          CharacterStatus.init,
    );

Map<String, dynamic> _$CharacterStateToJson(CharacterState instance) =>
    <String, dynamic>{
      'character': _$CharacterTypeEnumMap[instance.character]!,
      'academicType': _$AcademicTypeEnumMap[instance.academicType]!,
      'ieltsType': _$IeltsTypeEnumMap[instance.ieltsType]!,
      'selectTabLevelType':
          _$SelectTabLevelTypeEnumMap[instance.selectTabLevelType]!,
      'status': _$CharacterStatusEnumMap[instance.status]!,
    };

const _$CharacterTypeEnumMap = {
  CharacterType.cosmo: 'cosmo',
  CharacterType.zina: 'zina',
  CharacterType.unknown: 'unknown',
};

const _$AcademicTypeEnumMap = {
  AcademicType.a1: 'a1',
  AcademicType.a2: 'a2',
  AcademicType.b1: 'b1',
  AcademicType.b1Plus: 'b1Plus',
  AcademicType.b2: 'b2',
  AcademicType.c1: 'c1',
  AcademicType.unknown: 'unknown',
};

const _$IeltsTypeEnumMap = {
  IeltsType.ms1: 'ms1',
  IeltsType.ms2: 'ms2',
  IeltsType.ms3: 'ms3',
  IeltsType.unknown: 'unknown',
};

const _$SelectTabLevelTypeEnumMap = {
  SelectTabLevelType.academic: 'academic',
  SelectTabLevelType.ielts: 'ielts',
};

const _$CharacterStatusEnumMap = {
  CharacterStatus.init: 'init',
  CharacterStatus.success: 'success',
  CharacterStatus.failed: 'failed',
};
