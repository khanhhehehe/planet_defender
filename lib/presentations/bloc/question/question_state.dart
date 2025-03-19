import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/domain/entities/meteorite_detail.dart';
import 'package:planet_defender/domain/entities/meteorite.dart';
import 'package:planet_defender/domain/entities/questions.dart';
import 'package:planet_defender/domain/entities/time_configs.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'question_state.g.dart';

@CopyWith()
@JsonSerializable()
class QuestionState extends Equatable {
  final List<List<Meteorite>> listDoubleQuestion;
  final List<String> questionIds;
  final Map<String, Questions> questionDetails;
  final Map<int, List<TimeConfig>> questionTimeConfigDetail;
  final List<String> listIdDone;
  final int round;
  final int score;
  final double maxHeight;
  final String id;
  final List<Meteorite> listMeteorite;
  final List<ItemMeteorite> listCurrentMeteorite;
  final int blood;
  final int mana;
  final int coin;
  final bool isGameOver;
  final bool endRound;
  final bool isSpin;
  final int numberOfCorrectAnswers;
  final int combo;
  final bool isPause;
  const QuestionState(
      {this.score = 0,
      this.isPause = false,
      this.listIdDone = const [],
      this.listDoubleQuestion = const [],
      this.maxHeight = 0,
      this.isSpin = false,
      this.combo = 0,
      this.coin = 0,
      this.numberOfCorrectAnswers = 0,
      this.id = '',
      this.endRound = false,
      this.listCurrentMeteorite = const [],
      this.questionIds = const [],
      this.questionDetails = const {},
      this.listMeteorite = const [],
      this.questionTimeConfigDetail = const {},
      this.round = 0,
      this.blood = 100,
      this.mana = 0,
      this.isGameOver = false});

  @override
  List<Object> get props => [
        listIdDone,
        questionIds,
        questionDetails,
        questionTimeConfigDetail,
        round,
        listMeteorite,
        id,
        listCurrentMeteorite,
        blood,
        mana,
        score,
        isPause,
        coin,
        isGameOver,
        endRound,
        maxHeight,
        isSpin,
        numberOfCorrectAnswers,
        combo,
        listDoubleQuestion
      ];

  factory QuestionState.fromJson(Map<String, dynamic> json) =>
      _$QuestionStateFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionStateToJson(this);
}
