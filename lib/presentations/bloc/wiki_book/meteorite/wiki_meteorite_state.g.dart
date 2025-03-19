// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wiki_meteorite_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WikiMeteoriteStateCWProxy {
  WikiMeteoriteState meteorites(
      Map<QuestionsType, QuestionsTypeModel> meteorites);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WikiMeteoriteState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WikiMeteoriteState(...).copyWith(id: 12, name: "My name")
  /// ````
  WikiMeteoriteState call({
    Map<QuestionsType, QuestionsTypeModel>? meteorites,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWikiMeteoriteState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWikiMeteoriteState.copyWith.fieldName(...)`
class _$WikiMeteoriteStateCWProxyImpl implements _$WikiMeteoriteStateCWProxy {
  final WikiMeteoriteState _value;

  const _$WikiMeteoriteStateCWProxyImpl(this._value);

  @override
  WikiMeteoriteState meteorites(
          Map<QuestionsType, QuestionsTypeModel> meteorites) =>
      this(meteorites: meteorites);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WikiMeteoriteState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WikiMeteoriteState(...).copyWith(id: 12, name: "My name")
  /// ````
  WikiMeteoriteState call({
    Object? meteorites = const $CopyWithPlaceholder(),
  }) {
    return WikiMeteoriteState(
      meteorites:
          meteorites == const $CopyWithPlaceholder() || meteorites == null
              ? _value.meteorites
              // ignore: cast_nullable_to_non_nullable
              : meteorites as Map<QuestionsType, QuestionsTypeModel>,
    );
  }
}

extension $WikiMeteoriteStateCopyWith on WikiMeteoriteState {
  /// Returns a callable class that can be used as follows: `instanceOfWikiMeteoriteState.copyWith(...)` or like so:`instanceOfWikiMeteoriteState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WikiMeteoriteStateCWProxy get copyWith =>
      _$WikiMeteoriteStateCWProxyImpl(this);
}
