// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:planet_defender/data/models/response/avatar_user_response.dart';
import 'package:planet_defender/data/models/response/tag_user_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:planet_defender/data/models/base_model.dart';
import 'package:planet_defender/data/models/response/game_history_response.dart';

part 'personal_response.g.dart';

@JsonSerializable()
class PersonalInfoResponse {
  String name;
  String avatarPath;
  String code;
  String userName;
  String accountType;
  String gameLevel;
  int currentRank;
  int achievement;
  int level;
  int totalGamePlay;
  int characterOwned;
  int spaceshipOwned;
  int exp;
  int totalExp;
  int fselCoin;
  List<GameHistoryResponse> gameHistory;
  String id;
  String createdUserId;
  String updatedUserId;
  String createdFullName;
  String updatedFullName;
  int battle;
  int destroyed;
  int combo;
  int zMatter;
  int season;
  int totalScore;
  int playedTime;
  int spaceshipUsed;
  List<AvatarUserResponse> avatars;
  List<TagUserResponse> tags;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  DateTime? createdDate;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  DateTime? updatedDate;
  PersonalInfoResponse({
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

  factory PersonalInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PersonalInfoResponseToJson(this);
}
