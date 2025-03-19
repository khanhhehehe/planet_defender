// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spaceships_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SpaceshipsStateCWProxy {
  SpaceshipsState spaceShipIds(List<String> spaceShipIds);

  SpaceshipsState spaceShips(Map<String, Spaceship> spaceShips);

  SpaceshipsState status(SpaceshipsStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SpaceshipsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SpaceshipsState(...).copyWith(id: 12, name: "My name")
  /// ````
  SpaceshipsState call({
    List<String>? spaceShipIds,
    Map<String, Spaceship>? spaceShips,
    SpaceshipsStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSpaceshipsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSpaceshipsState.copyWith.fieldName(...)`
class _$SpaceshipsStateCWProxyImpl implements _$SpaceshipsStateCWProxy {
  final SpaceshipsState _value;

  const _$SpaceshipsStateCWProxyImpl(this._value);

  @override
  SpaceshipsState spaceShipIds(List<String> spaceShipIds) =>
      this(spaceShipIds: spaceShipIds);

  @override
  SpaceshipsState spaceShips(Map<String, Spaceship> spaceShips) =>
      this(spaceShips: spaceShips);

  @override
  SpaceshipsState status(SpaceshipsStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SpaceshipsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SpaceshipsState(...).copyWith(id: 12, name: "My name")
  /// ````
  SpaceshipsState call({
    Object? spaceShipIds = const $CopyWithPlaceholder(),
    Object? spaceShips = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return SpaceshipsState(
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
          : status as SpaceshipsStatus,
    );
  }
}

extension $SpaceshipsStateCopyWith on SpaceshipsState {
  /// Returns a callable class that can be used as follows: `instanceOfSpaceshipsState.copyWith(...)` or like so:`instanceOfSpaceshipsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SpaceshipsStateCWProxy get copyWith => _$SpaceshipsStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceshipsState _$SpaceshipsStateFromJson(Map<String, dynamic> json) =>
    SpaceshipsState(
      status: $enumDecodeNullable(_$SpaceshipsStatusEnumMap, json['status']) ??
          SpaceshipsStatus.init,
      spaceShips: (json['spaceShips'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, Spaceship.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      spaceShipIds: (json['spaceShipIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SpaceshipsStateToJson(SpaceshipsState instance) =>
    <String, dynamic>{
      'status': _$SpaceshipsStatusEnumMap[instance.status]!,
      'spaceShips': instance.spaceShips,
      'spaceShipIds': instance.spaceShipIds,
    };

const _$SpaceshipsStatusEnumMap = {
  SpaceshipsStatus.init: 'init',
  SpaceshipsStatus.start: 'start',
  SpaceshipsStatus.success: 'success',
  SpaceshipsStatus.error: 'error',
};
