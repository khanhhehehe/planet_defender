// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countdown_time_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CountdownTimeStateCWProxy {
  CountdownTimeState countTimeStatus(StandaloneStatus countTimeStatus);

  CountdownTimeState executionTime(int? executionTime);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CountdownTimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CountdownTimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  CountdownTimeState call({
    StandaloneStatus? countTimeStatus,
    int? executionTime,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCountdownTimeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCountdownTimeState.copyWith.fieldName(...)`
class _$CountdownTimeStateCWProxyImpl implements _$CountdownTimeStateCWProxy {
  final CountdownTimeState _value;

  const _$CountdownTimeStateCWProxyImpl(this._value);

  @override
  CountdownTimeState countTimeStatus(StandaloneStatus countTimeStatus) =>
      this(countTimeStatus: countTimeStatus);

  @override
  CountdownTimeState executionTime(int? executionTime) =>
      this(executionTime: executionTime);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CountdownTimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CountdownTimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  CountdownTimeState call({
    Object? countTimeStatus = const $CopyWithPlaceholder(),
    Object? executionTime = const $CopyWithPlaceholder(),
  }) {
    return CountdownTimeState(
      countTimeStatus: countTimeStatus == const $CopyWithPlaceholder() ||
              countTimeStatus == null
          ? _value.countTimeStatus
          // ignore: cast_nullable_to_non_nullable
          : countTimeStatus as StandaloneStatus,
      executionTime: executionTime == const $CopyWithPlaceholder()
          ? _value.executionTime
          // ignore: cast_nullable_to_non_nullable
          : executionTime as int?,
    );
  }
}

extension $CountdownTimeStateCopyWith on CountdownTimeState {
  /// Returns a callable class that can be used as follows: `instanceOfCountdownTimeState.copyWith(...)` or like so:`instanceOfCountdownTimeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CountdownTimeStateCWProxy get copyWith =>
      _$CountdownTimeStateCWProxyImpl(this);
}
