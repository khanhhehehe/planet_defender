// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buff_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BuffStateCWProxy {
  BuffState listZBuff(List<ZBuffType> listZBuff);

  BuffState totalZMaster(int totalZMaster);

  BuffState zBuffType(ZBuffType zBuffType);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BuffState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BuffState(...).copyWith(id: 12, name: "My name")
  /// ````
  BuffState call({
    List<ZBuffType>? listZBuff,
    int? totalZMaster,
    ZBuffType? zBuffType,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBuffState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBuffState.copyWith.fieldName(...)`
class _$BuffStateCWProxyImpl implements _$BuffStateCWProxy {
  final BuffState _value;

  const _$BuffStateCWProxyImpl(this._value);

  @override
  BuffState listZBuff(List<ZBuffType> listZBuff) => this(listZBuff: listZBuff);

  @override
  BuffState totalZMaster(int totalZMaster) => this(totalZMaster: totalZMaster);

  @override
  BuffState zBuffType(ZBuffType zBuffType) => this(zBuffType: zBuffType);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BuffState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BuffState(...).copyWith(id: 12, name: "My name")
  /// ````
  BuffState call({
    Object? listZBuff = const $CopyWithPlaceholder(),
    Object? totalZMaster = const $CopyWithPlaceholder(),
    Object? zBuffType = const $CopyWithPlaceholder(),
  }) {
    return BuffState(
      listZBuff: listZBuff == const $CopyWithPlaceholder() || listZBuff == null
          ? _value.listZBuff
          // ignore: cast_nullable_to_non_nullable
          : listZBuff as List<ZBuffType>,
      totalZMaster:
          totalZMaster == const $CopyWithPlaceholder() || totalZMaster == null
              ? _value.totalZMaster
              // ignore: cast_nullable_to_non_nullable
              : totalZMaster as int,
      zBuffType: zBuffType == const $CopyWithPlaceholder() || zBuffType == null
          ? _value.zBuffType
          // ignore: cast_nullable_to_non_nullable
          : zBuffType as ZBuffType,
    );
  }
}

extension $BuffStateCopyWith on BuffState {
  /// Returns a callable class that can be used as follows: `instanceOfBuffState.copyWith(...)` or like so:`instanceOfBuffState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BuffStateCWProxy get copyWith => _$BuffStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuffState _$BuffStateFromJson(Map<String, dynamic> json) => BuffState(
      zBuffType: $enumDecodeNullable(_$ZBuffTypeEnumMap, json['zBuffType']) ??
          ZBuffType.unknown,
      listZBuff: (json['listZBuff'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ZBuffTypeEnumMap, e))
              .toList() ??
          const [],
      totalZMaster: json['totalZMaster'] as int? ?? 0,
    );

Map<String, dynamic> _$BuffStateToJson(BuffState instance) => <String, dynamic>{
      'zBuffType': _$ZBuffTypeEnumMap[instance.zBuffType]!,
      'listZBuff':
          instance.listZBuff.map((e) => _$ZBuffTypeEnumMap[e]!).toList(),
      'totalZMaster': instance.totalZMaster,
    };

const _$ZBuffTypeEnumMap = {
  ZBuffType.coin1: 'coin1',
  ZBuffType.coin2: 'coin2',
  ZBuffType.coin3: 'coin3',
  ZBuffType.windBlade: 'windBlade',
  ZBuffType.stopWatch: 'stopWatch',
  ZBuffType.gumBomp: 'gumBomp',
  ZBuffType.shield: 'shield',
  ZBuffType.powerUp: 'powerUp',
  ZBuffType.spaceNuke: 'spaceNuke',
  ZBuffType.xRayCube: 'xRayCube',
  ZBuffType.goldExtractor: 'goldExtractor',
  ZBuffType.deepSpaceFreeze: 'deepSpaceFreeze',
  ZBuffType.unknown: 'unknown',
};
