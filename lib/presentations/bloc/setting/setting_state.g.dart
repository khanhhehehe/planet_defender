// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingStateCWProxy {
  SettingState isHighGraphics(bool isHighGraphics);

  SettingState isSoundEffects(bool isSoundEffects);

  SettingState isSoundtrack(bool isSoundtrack);

  SettingState isVibrate(bool isVibrate);

  SettingState language(LanguageType language);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingState(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingState call({
    bool? isHighGraphics,
    bool? isSoundEffects,
    bool? isSoundtrack,
    bool? isVibrate,
    LanguageType? language,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSettingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSettingState.copyWith.fieldName(...)`
class _$SettingStateCWProxyImpl implements _$SettingStateCWProxy {
  final SettingState _value;

  const _$SettingStateCWProxyImpl(this._value);

  @override
  SettingState isHighGraphics(bool isHighGraphics) =>
      this(isHighGraphics: isHighGraphics);

  @override
  SettingState isSoundEffects(bool isSoundEffects) =>
      this(isSoundEffects: isSoundEffects);

  @override
  SettingState isSoundtrack(bool isSoundtrack) =>
      this(isSoundtrack: isSoundtrack);

  @override
  SettingState isVibrate(bool isVibrate) => this(isVibrate: isVibrate);

  @override
  SettingState language(LanguageType language) => this(language: language);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingState(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingState call({
    Object? isHighGraphics = const $CopyWithPlaceholder(),
    Object? isSoundEffects = const $CopyWithPlaceholder(),
    Object? isSoundtrack = const $CopyWithPlaceholder(),
    Object? isVibrate = const $CopyWithPlaceholder(),
    Object? language = const $CopyWithPlaceholder(),
  }) {
    return SettingState(
      isHighGraphics: isHighGraphics == const $CopyWithPlaceholder() ||
              isHighGraphics == null
          ? _value.isHighGraphics
          // ignore: cast_nullable_to_non_nullable
          : isHighGraphics as bool,
      isSoundEffects: isSoundEffects == const $CopyWithPlaceholder() ||
              isSoundEffects == null
          ? _value.isSoundEffects
          // ignore: cast_nullable_to_non_nullable
          : isSoundEffects as bool,
      isSoundtrack:
          isSoundtrack == const $CopyWithPlaceholder() || isSoundtrack == null
              ? _value.isSoundtrack
              // ignore: cast_nullable_to_non_nullable
              : isSoundtrack as bool,
      isVibrate: isVibrate == const $CopyWithPlaceholder() || isVibrate == null
          ? _value.isVibrate
          // ignore: cast_nullable_to_non_nullable
          : isVibrate as bool,
      language: language == const $CopyWithPlaceholder() || language == null
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as LanguageType,
    );
  }
}

extension $SettingStateCopyWith on SettingState {
  /// Returns a callable class that can be used as follows: `instanceOfSettingState.copyWith(...)` or like so:`instanceOfSettingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SettingStateCWProxy get copyWith => _$SettingStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingState _$SettingStateFromJson(Map<String, dynamic> json) => SettingState(
      isSoundtrack: json['isSoundtrack'] as bool? ?? false,
      isSoundEffects: json['isSoundEffects'] as bool? ?? false,
      isHighGraphics: json['isHighGraphics'] as bool? ?? false,
      isVibrate: json['isVibrate'] as bool? ?? false,
      language: $enumDecodeNullable(_$LanguageTypeEnumMap, json['language']) ??
          LanguageType.en,
    );

Map<String, dynamic> _$SettingStateToJson(SettingState instance) =>
    <String, dynamic>{
      'isSoundtrack': instance.isSoundtrack,
      'isSoundEffects': instance.isSoundEffects,
      'isHighGraphics': instance.isHighGraphics,
      'isVibrate': instance.isVibrate,
      'language': _$LanguageTypeEnumMap[instance.language]!,
    };

const _$LanguageTypeEnumMap = {
  LanguageType.en: 'en',
  LanguageType.vi: 'vi',
};
