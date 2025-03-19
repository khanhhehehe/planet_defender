// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wiki_spaceship_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WikiSpaceshipStateCWProxy {
  WikiSpaceshipState spaceShipIds(List<String> spaceShipIds);

  WikiSpaceshipState spaceShips(Map<String, Spaceship> spaceShips);

  WikiSpaceshipState status(WikiSpaceshipStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WikiSpaceshipState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WikiSpaceshipState(...).copyWith(id: 12, name: "My name")
  /// ````
  WikiSpaceshipState call({
    List<String>? spaceShipIds,
    Map<String, Spaceship>? spaceShips,
    WikiSpaceshipStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWikiSpaceshipState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWikiSpaceshipState.copyWith.fieldName(...)`
class _$WikiSpaceshipStateCWProxyImpl implements _$WikiSpaceshipStateCWProxy {
  final WikiSpaceshipState _value;

  const _$WikiSpaceshipStateCWProxyImpl(this._value);

  @override
  WikiSpaceshipState spaceShipIds(List<String> spaceShipIds) =>
      this(spaceShipIds: spaceShipIds);

  @override
  WikiSpaceshipState spaceShips(Map<String, Spaceship> spaceShips) =>
      this(spaceShips: spaceShips);

  @override
  WikiSpaceshipState status(WikiSpaceshipStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WikiSpaceshipState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WikiSpaceshipState(...).copyWith(id: 12, name: "My name")
  /// ````
  WikiSpaceshipState call({
    Object? spaceShipIds = const $CopyWithPlaceholder(),
    Object? spaceShips = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return WikiSpaceshipState(
      spaceShipIds:
          spaceShipIds == const $CopyWithPlaceholder() || spaceShipIds == null
              ? _value.spaceShipIds
              // ignore: cast_nullable_to_non_nullable
              : spaceShipIds as List<String>,
      spaceShips:
          spaceShips == const $CopyWithPlaceholder() || spaceShips == null
              ? _value.spaceShips
              // ignore: cast_nullable_to_non_nullable
              : spaceShips as Map<String, Spaceship>,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as WikiSpaceshipStatus,
    );
  }
}

extension $WikiSpaceshipStateCopyWith on WikiSpaceshipState {
  /// Returns a callable class that can be used as follows: `instanceOfWikiSpaceshipState.copyWith(...)` or like so:`instanceOfWikiSpaceshipState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WikiSpaceshipStateCWProxy get copyWith =>
      _$WikiSpaceshipStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WikiSpaceshipState _$WikiSpaceshipStateFromJson(Map<String, dynamic> json) =>
    WikiSpaceshipState(
      spaceShips: (json['spaceShips'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, Spaceship.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      spaceShipIds: (json['spaceShipIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status:
          $enumDecodeNullable(_$WikiSpaceshipStatusEnumMap, json['status']) ??
              WikiSpaceshipStatus.init,
    );

Map<String, dynamic> _$WikiSpaceshipStateToJson(WikiSpaceshipState instance) =>
    <String, dynamic>{
      'status': _$WikiSpaceshipStatusEnumMap[instance.status]!,
      'spaceShips': instance.spaceShips,
      'spaceShipIds': instance.spaceShipIds,
    };

const _$WikiSpaceshipStatusEnumMap = {
  WikiSpaceshipStatus.init: 'init',
  WikiSpaceshipStatus.start: 'start',
  WikiSpaceshipStatus.success: 'success',
  WikiSpaceshipStatus.error: 'error',
};
