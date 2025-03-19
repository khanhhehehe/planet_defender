// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoResponse _$PersonalInfoResponseFromJson(
        Map<String, dynamic> json) =>
    PersonalInfoResponse(
      name: json['name'] as String? ?? '',
      avatarPath: json['avatarPath'] as String? ?? '',
      code: json['code'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      accountType: json['accountType'] as String? ?? '',
      gameLevel: json['gameLevel'] as String? ?? '',
      currentRank: json['currentRank'] as int? ?? 0,
      achievement: json['achievement'] as int? ?? 0,
      level: json['level'] as int? ?? 0,
      totalGamePlay: json['totalGamePlay'] as int? ?? 0,
      characterOwned: json['characterOwned'] as int? ?? 0,
      spaceshipOwned: json['spaceshipOwned'] as int? ?? 0,
      exp: json['exp'] as int? ?? 0,
      totalExp: json['totalExp'] as int? ?? 0,
      fselCoin: json['fselCoin'] as int? ?? 0,
      gameHistory: (json['gameHistory'] as List<dynamic>?)
              ?.map((e) =>
                  GameHistoryResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as String? ?? '',
      createdUserId: json['createdUserId'] as String? ?? '',
      updatedUserId: json['updatedUserId'] as String? ?? '',
      createdFullName: json['createdFullName'] as String? ?? '',
      updatedFullName: json['updatedFullName'] as String? ?? '',
      createdDate: BaseModel.dateFromJson(json['createdDate'] as String?),
      updatedDate: BaseModel.dateFromJson(json['updatedDate'] as String?),
      battle: json['battle'] as int? ?? 0,
      destroyed: json['destroyed'] as int? ?? 0,
      combo: json['combo'] as int? ?? 0,
      zMatter: json['zMatter'] as int? ?? 0,
      season: json['season'] as int? ?? 0,
      totalScore: json['totalScore'] as int? ?? 0,
      playedTime: json['playedTime'] as int? ?? 0,
      avatars: (json['avatars'] as List<dynamic>?)
              ?.map(
                  (e) => AvatarUserResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => TagUserResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      spaceshipUsed: json['spaceshipUsed'] as int? ?? 0,
    );

Map<String, dynamic> _$PersonalInfoResponseToJson(
    PersonalInfoResponse instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'avatarPath': instance.avatarPath,
    'code': instance.code,
    'userName': instance.userName,
    'accountType': instance.accountType,
    'gameLevel': instance.gameLevel,
    'currentRank': instance.currentRank,
    'achievement': instance.achievement,
    'level': instance.level,
    'totalGamePlay': instance.totalGamePlay,
    'characterOwned': instance.characterOwned,
    'spaceshipOwned': instance.spaceshipOwned,
    'exp': instance.exp,
    'totalExp': instance.totalExp,
    'fselCoin': instance.fselCoin,
    'gameHistory': instance.gameHistory,
    'id': instance.id,
    'createdUserId': instance.createdUserId,
    'updatedUserId': instance.updatedUserId,
    'createdFullName': instance.createdFullName,
    'updatedFullName': instance.updatedFullName,
    'battle': instance.battle,
    'destroyed': instance.destroyed,
    'combo': instance.combo,
    'zMatter': instance.zMatter,
    'season': instance.season,
    'totalScore': instance.totalScore,
    'playedTime': instance.playedTime,
    'spaceshipUsed': instance.spaceshipUsed,
    'avatars': instance.avatars,
    'tags': instance.tags,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdDate', instance.createdDate?.toIso8601String());
  writeNotNull('updatedDate', instance.updatedDate?.toIso8601String());
  return val;
}
