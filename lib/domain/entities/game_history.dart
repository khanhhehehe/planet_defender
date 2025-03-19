// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/data/models/base_model.dart';
import 'package:planet_defender/domain/entities/student_answers.dart';

part 'game_history.g.dart';

@JsonSerializable()
class GameHistory {
  final int roundNumber;
  final int score;
  final String spaceShipId;
  final String studentGameInfoId;
  final String spaceShipCode;
  final int numberOfToken;
  final int impactNumber;
  final int destroyNumber;
  final int comboNumber;
  final int zPlanetNumber;
  final int totalScore;
  final List<StudentAnswers> studentAnswers;
  final String id;
  final String createdUserId;
  final String updatedUserId;
  final String createdFullName;
  final String updatedFullName;
  final int coin;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? createdDate;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  final DateTime? updatedDate;

  const GameHistory({
    this.roundNumber = 0,
    this.score = 0,
    this.spaceShipId = '',
    this.studentGameInfoId = '',
    this.spaceShipCode = '',
    this.numberOfToken = 0,
    this.impactNumber = 0,
    this.destroyNumber = 0,
    this.comboNumber = 0,
    this.zPlanetNumber = 0,
    this.totalScore = 0,
    this.studentAnswers = const [],
    this.id = '',
    this.createdUserId = '',
    this.updatedUserId = '',
    this.createdFullName = '',
    this.updatedFullName = '',
    this.createdDate,
    this.updatedDate,
    this.coin = 0,
  });

  factory GameHistory.fromJson(Map<String, dynamic> json) =>
      _$GameHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$GameHistoryToJson(this);
}
