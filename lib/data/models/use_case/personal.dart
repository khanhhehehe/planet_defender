import 'package:planet_defender/domain/entities/avatar_user.dart';
import 'package:planet_defender/domain/entities/game_history.dart';
import 'package:planet_defender/domain/entities/tag_user.dart';

class PersonalInfoUseCaseData {
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
  final Map<String, GameHistory> gameHistory;
  final List<String> historyIds;
  final String code;
  final String accountType;
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

  const PersonalInfoUseCaseData({
    this.name = '',
    this.avatarPath = '',
    this.currentRank = '',
    this.level = 0,
    this.totalGamePlay = 0,
    this.characterOwned = 0,
    this.spaceshipOwned = 0,
    this.exp = 0,
    this.totalExp = 0,
    this.fselCoin = 0,
    this.gameHistory = const {},
    this.historyIds = const [],
    this.code = '',
    this.accountType = '',
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
  });
}
