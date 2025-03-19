// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_play_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GamePlayStateCWProxy {
  GamePlayState isShowKeyBoard(bool isShowKeyBoard);

  GamePlayState isShowKeyBoardAndIntro(bool isShowKeyBoardAndIntro);

  GamePlayState isShowQuest(bool isShowQuest);

  GamePlayState type(GamePlayScreensType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GamePlayState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GamePlayState(...).copyWith(id: 12, name: "My name")
  /// ````
  GamePlayState call({
    bool? isShowKeyBoard,
    bool? isShowKeyBoardAndIntro,
    bool? isShowQuest,
    GamePlayScreensType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGamePlayState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGamePlayState.copyWith.fieldName(...)`
class _$GamePlayStateCWProxyImpl implements _$GamePlayStateCWProxy {
  final GamePlayState _value;

  const _$GamePlayStateCWProxyImpl(this._value);

  @override
  GamePlayState isShowKeyBoard(bool isShowKeyBoard) =>
      this(isShowKeyBoard: isShowKeyBoard);

  @override
  GamePlayState isShowKeyBoardAndIntro(bool isShowKeyBoardAndIntro) =>
      this(isShowKeyBoardAndIntro: isShowKeyBoardAndIntro);

  @override
  GamePlayState isShowQuest(bool isShowQuest) => this(isShowQuest: isShowQuest);

  @override
  GamePlayState type(GamePlayScreensType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GamePlayState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GamePlayState(...).copyWith(id: 12, name: "My name")
  /// ````
  GamePlayState call({
    Object? isShowKeyBoard = const $CopyWithPlaceholder(),
    Object? isShowKeyBoardAndIntro = const $CopyWithPlaceholder(),
    Object? isShowQuest = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return GamePlayState(
      isShowKeyBoard: isShowKeyBoard == const $CopyWithPlaceholder() ||
              isShowKeyBoard == null
          ? _value.isShowKeyBoard
          // ignore: cast_nullable_to_non_nullable
          : isShowKeyBoard as bool,
      isShowKeyBoardAndIntro:
          isShowKeyBoardAndIntro == const $CopyWithPlaceholder() ||
                  isShowKeyBoardAndIntro == null
              ? _value.isShowKeyBoardAndIntro
              // ignore: cast_nullable_to_non_nullable
              : isShowKeyBoardAndIntro as bool,
      isShowQuest:
          isShowQuest == const $CopyWithPlaceholder() || isShowQuest == null
              ? _value.isShowQuest
              // ignore: cast_nullable_to_non_nullable
              : isShowQuest as bool,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as GamePlayScreensType,
    );
  }
}

extension $GamePlayStateCopyWith on GamePlayState {
  /// Returns a callable class that can be used as follows: `instanceOfGamePlayState.copyWith(...)` or like so:`instanceOfGamePlayState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GamePlayStateCWProxy get copyWith => _$GamePlayStateCWProxyImpl(this);
}
