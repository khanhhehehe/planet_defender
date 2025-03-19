part of 'question_bloc.dart';

sealed class QuestionEvent extends Equatable {
  const QuestionEvent();
  @override
  List<Object> get props => [];
}

class GetTimeConfig extends QuestionEvent {
  const GetTimeConfig();
  @override
  List<Object> get props => [];
}

class InitQuestions extends QuestionEvent {
  final Completer completer;
  const InitQuestions({required this.completer});
  @override
  List<Object> get props => [completer];
}

class SetRound extends QuestionEvent {
  final Completer completer;

  const SetRound({required this.completer});
  @override
  List<Object> get props => [completer];
}

class SetEnableMeteorite extends QuestionEvent {
  final int index;
  final bool isEnable;
  const SetEnableMeteorite({required this.index, required this.isEnable});
  @override
  List<Object> get props => [index, isEnable];
}

class SelectQuestion extends QuestionEvent {
  final String id;
  const SelectQuestion({required this.id});
  @override
  List<Object> get props => [id];
}

class SetListCurrentQuestion extends QuestionEvent {
  final int index;
  final Completer completer;
  const SetListCurrentQuestion({required this.index, required this.completer});
  @override
  List<Object> get props => [index, completer];
}

class SetBlood extends QuestionEvent {
  final int blood;
  const SetBlood({required this.blood});
  @override
  List<Object> get props => [blood];
}

class SetMana extends QuestionEvent {
  final int mana;
  const SetMana({required this.mana});
  @override
  List<Object> get props => [mana];
}

class InitMana extends QuestionEvent {
  const InitMana();
  @override
  List<Object> get props => [];
}

class SetScore extends QuestionEvent {
  final int score;
  const SetScore({required this.score});
  @override
  List<Object> get props => [score];
}

class SetCoin extends QuestionEvent {
  final int coin;
  const SetCoin({required this.coin});
  @override
  List<Object> get props => [coin];
}

class GameOver extends QuestionEvent {
  const GameOver();
  @override
  List<Object> get props => [];
}

class EndRound extends QuestionEvent {
  const EndRound();
  @override
  List<Object> get props => [];
}

class SetMaxHeight extends QuestionEvent {
  final double maxHeight;
  const SetMaxHeight({required this.maxHeight});
  @override
  List<Object> get props => [maxHeight];
}

class AnswerTheQuestion extends QuestionEvent {
  final Completer completer;
  final String answer;
  final String id;
  const AnswerTheQuestion(
      {required this.id, required this.completer, this.answer = ''});
  @override
  List<Object> get props => [completer, answer, id];
}

class SetDefaultAnswer extends QuestionEvent {
  final String id;
  const SetDefaultAnswer({required this.id});
  @override
  List<Object> get props => [id];
}

class ChangeRound extends QuestionEvent {
  const ChangeRound();
  @override
  List<Object> get props => [];
}

class CheckIsSpin extends QuestionEvent {
  @override
  List<Object> get props => [];
}

class SetCombo extends QuestionEvent {
  @override
  List<Object> get props => [];
}

class ChangePauseStatus extends QuestionEvent {
  final bool pauseStatus;
  const ChangePauseStatus({required this.pauseStatus});
  @override
  List<Object> get props => [pauseStatus];
}
