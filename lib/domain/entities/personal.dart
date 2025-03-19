// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:planet_defender/data/models/response/avatar_user_response.dart';
import 'package:planet_defender/data/models/response/tag_user_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:planet_defender/data/models/base_model.dart';
import 'package:planet_defender/data/models/response/game_history_response.dart';

part 'personal.g.dart';

@JsonSerializable()
class PersonalInfo {
  final String name;
  final String avatarPath;
  final String code;
  final String userName;
  final String accountType;
  final String gameLevel;
  final int currentRank;
  final int achievement;
  final int level;
  final int totalGamePlay;
  final int characterOwned;
  final int spaceshipOwned;
  final int exp;
  final int totalExp;
  final int fselCoin;
  final List<GameHistoryResponse> gameHistory;
  final String id;
  final String createdUserId;
  final String updatedUserId;
  final String createdFullName;
  final String updatedFullName;
  final int battle;
  final int destroyed;
  final int combo;
  final int zMatter;
  final int season;
  final int totalScore;
  final int playedTime;
  final int spaceshipUsed;
  final List<AvatarUserResponse> avatars;
  final List<TagUserResponse> tags;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? createdDate;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? updatedDate;
  const PersonalInfo({
    this.name = '',
    this.avatarPath = '',
    this.code = '',
    this.userName = '',
    this.accountType = '',
    this.gameLevel = '',
    this.currentRank = 0,
    this.achievement = 0,
    this.level = 0,
    this.totalGamePlay = 0,
    this.characterOwned = 0,
    this.spaceshipOwned = 0,
    this.exp = 0,
    this.totalExp = 0,
    this.fselCoin = 0,
    this.gameHistory = const [],
    this.id = '',
    this.createdUserId = '',
    this.updatedUserId = '',
    this.createdFullName = '',
    this.updatedFullName = '',
    this.createdDate,
    this.updatedDate,
    this.battle = 0,
    this.destroyed = 0,
    this.combo = 0,
    this.zMatter = 0,
    this.season = 0,
    this.totalScore = 0,
    this.playedTime = 0,
    this.avatars = const [],
    this.tags = const [],
    this.spaceshipUsed = 0,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);
}
