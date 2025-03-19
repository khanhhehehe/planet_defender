// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CharactersStateCWProxy {
  CharactersState characterIds(List<String> characterIds);

  CharactersState characters(Map<String, Character> characters);

  CharactersState status(CharactersStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharactersState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharactersState(...).copyWith(id: 12, name: "My name")
  /// ````
  CharactersState call({
    List<String>? characterIds,
    Map<String, Character>? characters,
    CharactersStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCharactersState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCharactersState.copyWith.fieldName(...)`
class _$CharactersStateCWProxyImpl implements _$CharactersStateCWProxy {
  final CharactersState _value;

  const _$CharactersStateCWProxyImpl(this._value);

  @override
  CharactersState characterIds(List<String> characterIds) =>
      this(characterIds: characterIds);

  @override
  CharactersState characters(Map<String, Character> characters) =>
      this(characters: characters);

  @override
  CharactersState status(CharactersStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharactersState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharactersState(...).copyWith(id: 12, name: "My name")
  /// ````
  CharactersState call({
    Object? characterIds = const $CopyWithPlaceholder(),
    Object? characters = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return CharactersState(
      characterIds:
          characterIds == const $CopyWithPlaceholder() || characterIds == null
              ? _value.characterIds
              // ignore: cast_nullable_to_non_nullable
              : characterIds as List<String>,
      characters:
          characters == const $CopyWithPlaceholder() || characters == null
              ? _value.characters
              // ignore: cast_nullable_to_non_nullable
              : characters as Map<String, Character>,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as CharactersStatus,
    );
  }
}

extension $CharactersStateCopyWith on CharactersState {
  /// Returns a callable class that can be used as follows: `instanceOfCharactersState.copyWith(...)` or like so:`instanceOfCharactersState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CharactersStateCWProxy get copyWith => _$CharactersStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersState _$CharactersStateFromJson(Map<String, dynamic> json) =>
    CharactersState(
      status: $enumDecodeNullable(_$CharactersStatusEnumMap, json['status']) ??
          CharactersStatus.init,
      characters: (json['characters'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, Character.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      characterIds: (json['characterIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CharactersStateToJson(CharactersState instance) =>
    <String, dynamic>{
      'status': _$CharactersStatusEnumMap[instance.status]!,
      'characters': instance.characters,
      'characterIds': instance.characterIds,
    };

const _$CharactersStatusEnumMap = {
  CharactersStatus.init: 'init',
  CharactersStatus.start: 'start',
  CharactersStatus.success: 'success',
  CharactersStatus.error: 'error',
};
