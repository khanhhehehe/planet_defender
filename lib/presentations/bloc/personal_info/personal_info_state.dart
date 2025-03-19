import 'package:planet_defender/data/models/enums/final_tab_type.dart';
import 'package:planet_defender/domain/entities/avatar_user.dart';
import 'package:planet_defender/domain/entities/game_history.dart';
import 'package:planet_defender/domain/entities/tag_user.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'personal_info_state.g.dart';

enum GetPersonalInfoStatus {
  init,
  start,
  success,
  failed,
}

@CopyWith()
class PersonalInfoState extends Equatable {
  final FinalTabType tabType;
  final String name;
  final String avatarPath;
  final String currentRank;
  final int level;
  final int totalGamePlay;
  final int characterOwned;
  final int spaceshipOwned;
  final int exp;
  final int totalExp;
  final int fselCoin;
  final String accountType;
  final String code;
  final Map<String, GameHistory> gameHistory;
  final List<String> gameHistoryIds;
  final int battle;
  final int destroyed;
  final int combo;
  final int zMatter;
  final int season;
  final int totalScore;
  final int playedTime;
  final String gameLevel;
  final Map<String, AvatarUser> avatars;
  final List<String> avatarIds;
  final Map<String, TagUser> tags;
  final List<String> tagIds;
  final int spaceshipUsed;
  final GetPersonalInfoStatus status;
  const PersonalInfoState({
    this.name = '',
    this.tabType = FinalTabType.finalize,
    this.avatarPath = '',
    this.currentRank = '',
    this.level = 0,
    this.totalGamePlay = 0,
    this.characterOwned = 0,
    this.spaceshipOwned = 0,
    this.exp = 0,
    this.totalExp = 0,
    this.fselCoin = 0,
    this.accountType = '',
    this.code = '',
    this.gameHistory = const {},
    this.gameHistoryIds = const [],
    this.battle = 0,
    this.destroyed = 0,
    this.combo = 0,
    this.zMatter = 0,
    this.season = 0,
    this.totalScore = 0,
    this.playedTime = 0,
    this.avatarIds = const [],
    this.avatars = const {},
    this.tagIds = const [],
    this.tags = const {},
    this.gameLevel = '',
    this.spaceshipUsed = 0,
    this.status = GetPersonalInfoStatus.init,
  });

  @override
  List<Object> get props => [
        name,
        avatarPath,
        currentRank,
        level,
        totalGamePlay,
        characterOwned,
        spaceshipOwned,
        exp,
        totalExp,
        fselCoin,
        accountType,
        code,
        status,
        battle,
        destroyed,
        combo,
        zMatter,
        season,
        totalScore,
        playedTime,
        avatarIds,
        avatars,
        tags,
        tagIds,
        gameLevel,
        spaceshipUsed,
        tabType
      ];
}

final class PersonalInfoInit extends PersonalInfoState {}
