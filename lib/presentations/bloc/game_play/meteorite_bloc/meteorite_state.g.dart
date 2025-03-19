// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meteorite_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeteoriteStateCWProxy {
  MeteoriteState listMeteorite(List<Meteorite> listMeteorite);

  MeteoriteState meteoriteSelected(String meteoriteSelected);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeteoriteState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeteoriteState(...).copyWith(id: 12, name: "My name")
  /// ````
  MeteoriteState call({
    List<Meteorite>? listMeteorite,
    String? meteoriteSelected,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMeteoriteState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMeteoriteState.copyWith.fieldName(...)`
class _$MeteoriteStateCWProxyImpl implements _$MeteoriteStateCWProxy {
  final MeteoriteState _value;

  const _$MeteoriteStateCWProxyImpl(this._value);

  @override
  MeteoriteState listMeteorite(List<Meteorite> listMeteorite) =>
      this(listMeteorite: listMeteorite);

  @override
  MeteoriteState meteoriteSelected(String meteoriteSelected) =>
      this(meteoriteSelected: meteoriteSelected);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeteoriteState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeteoriteState(...).copyWith(id: 12, name: "My name")
  /// ````
  MeteoriteState call({
    Object? listMeteorite = const $CopyWithPlaceholder(),
    Object? meteoriteSelected = const $CopyWithPlaceholder(),
  }) {
    return MeteoriteState(
      listMeteorite:
          listMeteorite == const $CopyWithPlaceholder() || listMeteorite == null
              ? _value.listMeteorite
              // ignore: cast_nullable_to_non_nullable
              : listMeteorite as List<Meteorite>,
      meteoriteSelected: meteoriteSelected == const $CopyWithPlaceholder() ||
              meteoriteSelected == null
          ? _value.meteoriteSelected
          // ignore: cast_nullable_to_non_nullable
          : meteoriteSelected as String,
    );
  }
}

extension $MeteoriteStateCopyWith on MeteoriteState {
  /// Returns a callable class that can be used as follows: `instanceOfMeteoriteState.copyWith(...)` or like so:`instanceOfMeteoriteState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeteoriteStateCWProxy get copyWith => _$MeteoriteStateCWProxyImpl(this);
}
