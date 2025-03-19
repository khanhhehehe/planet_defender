// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_history_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GameHistoryStateCWProxy {
  GameHistoryState gameHistory(GameHistory gameHistory);

  GameHistoryState gameHistoryId(String gameHistoryId);

  GameHistoryState gameHistoryStatus(GameHistoryStatus gameHistoryStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameHistoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameHistoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameHistoryState call({
    GameHistory? gameHistory,
    String? gameHistoryId,
    GameHistoryStatus? gameHistoryStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGameHistoryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGameHistoryState.copyWith.fieldName(...)`
class _$GameHistoryStateCWProxyImpl implements _$GameHistoryStateCWProxy {
  final GameHistoryState _value;

  const _$GameHistoryStateCWProxyImpl(this._value);

  @override
  GameHistoryState gameHistory(GameHistory gameHistory) =>
      this(gameHistory: gameHistory);

  @override
  GameHistoryState gameHistoryId(String gameHistoryId) =>
      this(gameHistoryId: gameHistoryId);

  @override
  GameHistoryState gameHistoryStatus(GameHistoryStatus gameHistoryStatus) =>
      this(gameHistoryStatus: gameHistoryStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameHistoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameHistoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameHistoryState call({
    Object? gameHistory = const $CopyWithPlaceholder(),
    Object? gameHistoryId = const $CopyWithPlaceholder(),
    Object? gameHistoryStatus = const $CopyWithPlaceholder(),
  }) {
    return GameHistoryState(
      gameHistory:
          gameHistory == const $CopyWithPlaceholder() || gameHistory == null
              ? _value.gameHistory
              // ignore: cast_nullable_to_non_nullable
              : gameHistory as GameHistory,
      gameHistoryId:
          gameHistoryId == const $CopyWithPlaceholder() || gameHistoryId == null
              ? _value.gameHistoryId
              // ignore: cast_nullable_to_non_nullable
              : gameHistoryId as String,
      gameHistoryStatus: gameHistoryStatus == const $CopyWithPlaceholder() ||
              gameHistoryStatus == null
          ? _value.gameHistoryStatus
          // ignore: cast_nullable_to_non_nullable
          : gameHistoryStatus as GameHistoryStatus,
    );
  }
}

extension $GameHistoryStateCopyWith on GameHistoryState {
  /// Returns a callable class that can be used as follows: `instanceOfGameHistoryState.copyWith(...)` or like so:`instanceOfGameHistoryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GameHistoryStateCWProxy get copyWith => _$GameHistoryStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameHistoryState _$GameHistoryStateFromJson(Map<String, dynamic> json) =>
    GameHistoryState(
      gameHistory: json['gameHistory'] == null
          ? const GameHistory()
          : GameHistory.fromJson(json['gameHistory'] as Map<String, dynamic>),
      gameHistoryId: json['gameHistoryId'] as String? ?? "",
      gameHistoryStatus: $enumDecodeNullable(
              _$GameHistoryStatusEnumMap, json['gameHistoryStatus']) ??
          GameHistoryStatus.fail,
    );

Map<String, dynamic> _$GameHistoryStateToJson(GameHistoryState instance) =>
    <String, dynamic>{
      'gameHistoryStatus':
          _$GameHistoryStatusEnumMap[instance.gameHistoryStatus]!,
      'gameHistoryId': instance.gameHistoryId,
      'gameHistory': instance.gameHistory,
    };

const _$GameHistoryStatusEnumMap = {
  GameHistoryStatus.fail: 'fail',
  GameHistoryStatus.success: 'success',
};
