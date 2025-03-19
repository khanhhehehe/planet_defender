// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FireStateCWProxy {
  FireState fireStatus(FireStatus fireStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FireState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FireState(...).copyWith(id: 12, name: "My name")
  /// ````
  FireState call({
    FireStatus? fireStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFireState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFireState.copyWith.fieldName(...)`
class _$FireStateCWProxyImpl implements _$FireStateCWProxy {
  final FireState _value;

  const _$FireStateCWProxyImpl(this._value);

  @override
  FireState fireStatus(FireStatus fireStatus) => this(fireStatus: fireStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FireState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FireState(...).copyWith(id: 12, name: "My name")
  /// ````
  FireState call({
    Object? fireStatus = const $CopyWithPlaceholder(),
  }) {
    return FireState(
      fireStatus:
          fireStatus == const $CopyWithPlaceholder() || fireStatus == null
              ? _value.fireStatus
              // ignore: cast_nullable_to_non_nullable
              : fireStatus as FireStatus,
    );
  }
}

extension $FireStateCopyWith on FireState {
  /// Returns a callable class that can be used as follows: `instanceOfFireState.copyWith(...)` or like so:`instanceOfFireState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FireStateCWProxy get copyWith => _$FireStateCWProxyImpl(this);
}
