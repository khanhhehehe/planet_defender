// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'game_play_state.g.dart';

@CopyWith()
class GamePlayState extends Equatable {
  final GamePlayScreensType type;
  final bool isShowKeyBoard;
  final bool isShowKeyBoardAndIntro;
  final bool isShowQuest;
  const GamePlayState({
    this.isShowKeyBoard = false,
    this.isShowKeyBoardAndIntro = false,
    this.isShowQuest = false,
    this.type = GamePlayScreensType.intro1,
  });

  @override
  List<Object> get props => [
        type,
        isShowKeyBoard,
        isShowKeyBoardAndIntro,
        isShowQuest,
      ];
}

final class GamePlayStateInitial extends GamePlayState {}
