// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_buy_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StatusBuyStateCWProxy {
  StatusBuyState price(int price);

  StatusBuyState showSnackBar(bool showSnackBar);

  StatusBuyState status(StatusBuy status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StatusBuyState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StatusBuyState(...).copyWith(id: 12, name: "My name")
  /// ````
  StatusBuyState call({
    int? price,
    bool? showSnackBar,
    StatusBuy? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStatusBuyState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStatusBuyState.copyWith.fieldName(...)`
class _$StatusBuyStateCWProxyImpl implements _$StatusBuyStateCWProxy {
  final StatusBuyState _value;

  const _$StatusBuyStateCWProxyImpl(this._value);

  @override
  StatusBuyState price(int price) => this(price: price);

  @override
  StatusBuyState showSnackBar(bool showSnackBar) =>
      this(showSnackBar: showSnackBar);

  @override
  StatusBuyState status(StatusBuy status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StatusBuyState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StatusBuyState(...).copyWith(id: 12, name: "My name")
  /// ````
  StatusBuyState call({
    Object? price = const $CopyWithPlaceholder(),
    Object? showSnackBar = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return StatusBuyState(
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int,
      showSnackBar:
          showSnackBar == const $CopyWithPlaceholder() || showSnackBar == null
              ? _value.showSnackBar
              // ignore: cast_nullable_to_non_nullable
              : showSnackBar as bool,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as StatusBuy,
    );
  }
}

extension $StatusBuyStateCopyWith on StatusBuyState {
  /// Returns a callable class that can be used as follows: `instanceOfStatusBuyState.copyWith(...)` or like so:`instanceOfStatusBuyState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StatusBuyStateCWProxy get copyWith => _$StatusBuyStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusBuyState _$StatusBuyStateFromJson(Map<String, dynamic> json) =>
    StatusBuyState(
      status: $enumDecodeNullable(_$StatusBuyEnumMap, json['status']) ??
          StatusBuy.init,
      price: json['price'] as int? ?? 0,
      showSnackBar: json['showSnackBar'] as bool? ?? false,
    );

Map<String, dynamic> _$StatusBuyStateToJson(StatusBuyState instance) =>
    <String, dynamic>{
      'status': _$StatusBuyEnumMap[instance.status]!,
      'price': instance.price,
      'showSnackBar': instance.showSnackBar,
    };

const _$StatusBuyEnumMap = {
  StatusBuy.init: 'init',
  StatusBuy.start: 'start',
  StatusBuy.success: 'success',
  StatusBuy.error: 'error',
};
