// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wiki_z_buff_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WikiZBuffStateCWProxy {
  WikiZBuffState wikiZBuffStatus(WikiZBuffStatus wikiZBuffStatus);

  WikiZBuffState zbuffIds(List<String> zbuffIds);

  WikiZBuffState zbuffs(Map<String, ZBuffsType> zbuffs);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WikiZBuffState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WikiZBuffState(...).copyWith(id: 12, name: "My name")
  /// ````
  WikiZBuffState call({
    WikiZBuffStatus? wikiZBuffStatus,
    List<String>? zbuffIds,
    Map<String, ZBuffsType>? zbuffs,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWikiZBuffState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWikiZBuffState.copyWith.fieldName(...)`
class _$WikiZBuffStateCWProxyImpl implements _$WikiZBuffStateCWProxy {
  final WikiZBuffState _value;

  const _$WikiZBuffStateCWProxyImpl(this._value);

  @override
  WikiZBuffState wikiZBuffStatus(WikiZBuffStatus wikiZBuffStatus) =>
      this(wikiZBuffStatus: wikiZBuffStatus);

  @override
  WikiZBuffState zbuffIds(List<String> zbuffIds) => this(zbuffIds: zbuffIds);

  @override
  WikiZBuffState zbuffs(Map<String, ZBuffsType> zbuffs) => this(zbuffs: zbuffs);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WikiZBuffState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WikiZBuffState(...).copyWith(id: 12, name: "My name")
  /// ````
  WikiZBuffState call({
    Object? wikiZBuffStatus = const $CopyWithPlaceholder(),
    Object? zbuffIds = const $CopyWithPlaceholder(),
    Object? zbuffs = const $CopyWithPlaceholder(),
  }) {
    return WikiZBuffState(
      wikiZBuffStatus: wikiZBuffStatus == const $CopyWithPlaceholder() ||
              wikiZBuffStatus == null
          ? _value.wikiZBuffStatus
          // ignore: cast_nullable_to_non_nullable
          : wikiZBuffStatus as WikiZBuffStatus,
      zbuffIds: zbuffIds == const $CopyWithPlaceholder() || zbuffIds == null
          ? _value.zbuffIds
          // ignore: cast_nullable_to_non_nullable
          : zbuffIds as List<String>,
      zbuffs: zbuffs == const $CopyWithPlaceholder() || zbuffs == null
          ? _value.zbuffs
          // ignore: cast_nullable_to_non_nullable
          : zbuffs as Map<String, ZBuffsType>,
    );
  }
}

extension $WikiZBuffStateCopyWith on WikiZBuffState {
  /// Returns a callable class that can be used as follows: `instanceOfWikiZBuffState.copyWith(...)` or like so:`instanceOfWikiZBuffState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WikiZBuffStateCWProxy get copyWith => _$WikiZBuffStateCWProxyImpl(this);
}
