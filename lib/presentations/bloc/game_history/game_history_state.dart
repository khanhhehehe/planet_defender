import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/domain/entities/game_history.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'game_history_state.g.dart';

enum GameHistoryStatus {
  fail,
  success,
}

@CopyWith()
@JsonSerializable()
class GameHistoryState extends Equatable {
  final GameHistoryStatus gameHistoryStatus;
  final String gameHistoryId;
  final GameHistory gameHistory;
  const GameHistoryState({
    this.gameHistory = const GameHistory(),
    this.gameHistoryId = "",
    this.gameHistoryStatus = GameHistoryStatus.fail,
  });

  @override
  List<Object> get props => [gameHistoryStatus, gameHistoryId, gameHistory];

  factory GameHistoryState.fromJson(Map<String, dynamic> json) =>
      _$GameHistoryStateFromJson(json);
  Map<String, dynamic> toJson() => _$GameHistoryStateToJson(this);
}

final class GameHistoryInitial extends GameHistoryState {}
