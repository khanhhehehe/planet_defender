// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyboard_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$KeyboardStateCWProxy {
  KeyboardState value(String value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `KeyboardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// KeyboardState(...).copyWith(id: 12, name: "My name")
  /// ````
  KeyboardState call({
    String? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfKeyboardState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfKeyboardState.copyWith.fieldName(...)`
class _$KeyboardStateCWProxyImpl implements _$KeyboardStateCWProxy {
  final KeyboardState _value;

  const _$KeyboardStateCWProxyImpl(this._value);

  @override
  KeyboardState value(String value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `KeyboardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// KeyboardState(...).copyWith(id: 12, name: "My name")
  /// ````
  KeyboardState call({
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return KeyboardState(
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String,
    );
  }
}

extension $KeyboardStateCopyWith on KeyboardState {
  /// Returns a callable class that can be used as follows: `instanceOfKeyboardState.copyWith(...)` or like so:`instanceOfKeyboardState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$KeyboardStateCWProxy get copyWith => _$KeyboardStateCWProxyImpl(this);
}
