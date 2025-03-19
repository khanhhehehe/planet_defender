// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:planet_defender/data/models/response/student_answers_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:planet_defender/data/models/base_model.dart';

part 'game_history_response.g.dart';

@JsonSerializable()
class GameHistoryResponse {
  int roundNumber;
  int score;
  String spaceShipId;
  String studentGameInfoId;
  String spaceShipCode;
  int numberOfToken;
  int impactNumber;
  int destroyNumber;
  int comboNumber;
  int zPlanetNumber;
  int totalScore;
  List<StudentAnswersResponse> studentAnswers;
  String id;
  String createdUserId;
  String updatedUserId;
  String createdFullName;
  String updatedFullName;
  int coin;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  DateTime? createdDate;
  @JsonKey(fromJson: BaseModel.dateFromJson)
  DateTime? updatedDate;
  GameHistoryResponse({
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

  factory GameHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GameHistoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GameHistoryResponseToJson(this);
}
