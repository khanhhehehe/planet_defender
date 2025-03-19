import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/utils/meteorite_utils.dart';
import 'package:planet_defender/data/models/request/answer_the_question_request.dart';
import 'package:planet_defender/data/models/use_case/questions.dart';
import 'package:planet_defender/data/models/use_case/time_config_use_case_data.dart';
import 'package:planet_defender/domain/entities/meteorite_detail.dart';
import 'package:planet_defender/domain/entities/meteorite.dart';
import 'package:planet_defender/domain/entities/time_configs.dart';
import 'package:planet_defender/domain/use_cases/questions_usecase.dart';
import 'package:planet_defender/presentations/bloc/game_history/game_history_bloc.dart';
import 'package:planet_defender/presentations/bloc/question/question_state.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'question_event.dart';

@lazySingleton
class QuestionBloc extends HydratedBloc<QuestionEvent, QuestionState> {
  final QuestionsUseCase _questionsUseCase;
  QuestionBloc()
      : _questionsUseCase = dI<QuestionsUseCase>(),
        super(const QuestionState()) {
    on<GetTimeConfig>(_questionTimeConfigDetail);
    on<SetRound>(_setRound);
    on<SelectQuestion>(_selectQuestion);
    on<SetEnableMeteorite>(_setEnableMeteorite);
    on<SetListCurrentQuestion>(_setListCurrentQuestion);
    on<InitQuestions>(_initQuestions);
    on<SetBlood>(_setBlood);
    on<SetMana>(_setMana);
    on<SetScore>(_setScore);
    on<SetCoin>(_setCoin);
    on<GameOver>(_gameOver);
    on<EndRound>(_endRound);
    on<InitMana>(_initMana);
    on<SetMaxHeight>(_setMaxHeight);
    on<AnswerTheQuestion>(_answerTheQuestion);
    on<ChangeRound>(_changeRound);
    on<CheckIsSpin>(_checkIsSpin);
    on<SetDefaultAnswer>(_setDefaultAnswer);
    on<SetCombo>(_setCombo);
    on<ChangePauseStatus>(_changePauseStatus);
  }

  FutureOr<void> _questionTimeConfigDetail(
      GetTimeConfig event, Emitter<QuestionState> emit) async {
    TimeConfigUseCaseData data =
        await _questionsUseCase.getGamePlayTimeConfig();
    emit(state.copyWith(
        questionTimeConfigDetail: data.questionTimeConfigDetail));
  }

  Future<void> _setRound(SetRound event, Emitter<QuestionState> emit) async {
    if (state.round != 0) {
      QuestionUseCaseData data = await _questionsUseCase.getQuestions(
          roundNumber: state.round.toString());
      List<TimeConfig> dataTimeConfig = state.questionTimeConfigDetail[1] ?? [];
      if (dataTimeConfig.isNotEmpty) {
        List<Meteorite> listMeteorite = data.questionDetails.entries.map((e) {
          final x = MeteoriteUtils().getDistanceMeteorites();
          final time = dataTimeConfig.singleWhere(
              (element) => element.gameVocabPDType == e.value.gameVocabType);
          return Meteorite(
            id: e.value.id,
            isEnable: false,
            gameVocabType: e.value.gameVocabType,
            roundNumber: state.round,
            questionContent: e.value.questionContent,
            time: time.time,
            percent: time.percent,
            y: state.maxHeight,
            x: x,
          );
        }).toList();
        event.completer.complete(listMeteorite);
        emit(state.copyWith(
            listIdDone: [],
            questionIds: data.questionIds,
            questionDetails: data.questionDetails,
            listMeteorite: listMeteorite,
            round: state.round,
            endRound: false));
      }
    }
  }

  FutureOr<void> _selectQuestion(
      SelectQuestion event, Emitter<QuestionState> emit) {
    emit(state.copyWith(id: event.id));
  }

  FutureOr<void> _setEnableMeteorite(
      SetEnableMeteorite event, Emitter<QuestionState> emit) {
    List<ItemMeteorite> list =
        state.listCurrentMeteorite.mapIndexed((index, element) {
      if (index == event.index) {
        return ItemMeteorite(
          id: element.id,
          isEnable: event.isEnable,
          listQuestion: element.listQuestion,
        );
      }
      return element;
    }).toList();
    emit(state.copyWith(listCurrentMeteorite: list));
  }

  Future<void> _setListCurrentQuestion(
      SetListCurrentQuestion event, Emitter<QuestionState> emit) async {
    if (state.round < 10) {
      List<ItemMeteorite> list = [
        ...state.listCurrentMeteorite,
        ItemMeteorite(
          id: state.listMeteorite[event.index].id,
          isEnable: false,
          listQuestion: [state.listMeteorite[event.index]],
        )
      ];
      emit(state.copyWith(listCurrentMeteorite: list));
      event.completer.complete(list);
    } else {
      if (event.index % 2 != 0) {
        List<ItemMeteorite> list = [
          ...state.listCurrentMeteorite,
          ItemMeteorite(
            id: "${state.listMeteorite[event.index - 1].id}_${state.listMeteorite[event.index].id}",
            isEnable: false,
            listQuestion: [
              state.listMeteorite[event.index - 1],
              state.listMeteorite[event.index]
            ],
          ),
        ];
        emit(state.copyWith(listCurrentMeteorite: list));
        event.completer.complete(list);
      } else {
        List<ItemMeteorite> list = [];
        event.completer.complete(list);
      }
    }
  }

  FutureOr<void> _initQuestions(
      InitQuestions event, Emitter<QuestionState> emit) {
    emit(state.copyWith(
      score: 0,
      coin: 0,
      numberOfCorrectAnswers: 0,
      id: '',
      listCurrentMeteorite: const [],
      questionIds: const [],
      questionDetails: const {},
      listMeteorite: const [],
      questionTimeConfigDetail: const {},
      round: 1,
      blood: 100,
      mana: 0,
      isGameOver: false,
      endRound: false,
    ));
    event.completer.complete(true);
  }

  FutureOr<void> _setBlood(SetBlood event, Emitter<QuestionState> emit) {
    final blood = state.blood - event.blood;
    emit(state.copyWith(blood: blood));
  }

  FutureOr<void> _setMana(SetMana event, Emitter<QuestionState> emit) {
    emit(state.copyWith(mana: state.mana + event.mana));
  }

  FutureOr<void> _initMana(InitMana event, Emitter<QuestionState> emit) {
    emit(state.copyWith(mana: 0));
  }

  FutureOr<void> _setScore(SetScore event, Emitter<QuestionState> emit) {
    emit(state.copyWith(score: state.score + event.score));
  }

  FutureOr<void> _setCoin(SetCoin event, Emitter<QuestionState> emit) {
    emit(state.copyWith(coin: state.coin + event.coin));
  }

  FutureOr<void> _gameOver(GameOver event, Emitter<QuestionState> emit) {
    if (state.blood <= 0) {
      emit(state.copyWith(isGameOver: true));
    } else {
      emit(state.copyWith(isGameOver: false));
    }
  }

  FutureOr<void> _endRound(EndRound event, Emitter<QuestionState> emit) {
    emit(state.copyWith(endRound: true));
  }

  FutureOr<void> _setMaxHeight(
      SetMaxHeight event, Emitter<QuestionState> emit) {
    emit(state.copyWith(maxHeight: event.maxHeight));
  }

  FutureOr<void> _answerTheQuestion(
      AnswerTheQuestion event, Emitter<QuestionState> emit) async {
    final item = state.questionDetails[event.id];
    bool data = await _questionsUseCase.answerTheQuestion(
        request: AnswerTheQuestionRequest(
            gameVocabularyId: item?.gameVocabularyId ?? "",
            gameVocabularyTypeId: item?.id ?? "",
            gameHistoryId: dI<GameHistoryBloc>().state.gameHistoryId,
            answer: event.answer));
    // gameVocabularyId: "2b0442dd-a580-4ee4-b3ae-d16313280bf3",
    // gameVocabularyTypeId: "8eb32866-1c50-4bd4-b57e-0beff30d8eba",
    // gameHistoryId: "f52660d2-bf0a-4c57-8eec-38d9a2446773",
    // answer: "electronics store"));
    event.completer.complete(data);
    if (data == true) {
      emit(state.copyWith(
          listIdDone: [...state.listIdDone, event.id],
          numberOfCorrectAnswers: state.numberOfCorrectAnswers + 1));
    } else {
      emit(state.copyWith(combo: 0));
    }
  }

  FutureOr<void> _changeRound(ChangeRound event, Emitter<QuestionState> emit) {
    int round = state.round + 1;
    emit(state.copyWith(
      round: round,
      id: '',
      listCurrentMeteorite: const [],
      questionIds: const [],
      questionDetails: const {},
      listMeteorite: const [],
      questionTimeConfigDetail: const {},
      blood: 100,
      mana: 0,
      isGameOver: false,
      endRound: false,
    ));
  }

  FutureOr<void> _checkIsSpin(CheckIsSpin event, Emitter<QuestionState> emit) {
    emit(state.copyWith(isSpin: !state.isSpin));
  }

  Future<FutureOr<void>> _setDefaultAnswer(
      SetDefaultAnswer event, Emitter<QuestionState> emit) async {
    final item = state.questionDetails[event.id];
    await _questionsUseCase.answerTheQuestion(
        request: AnswerTheQuestionRequest(
            gameVocabularyId: item?.gameVocabularyId ?? "",
            gameVocabularyTypeId: item?.id ?? "",
            gameHistoryId: dI<GameHistoryBloc>().state.gameHistoryId,
            answer: ""));
  }

  FutureOr<void> _setCombo(SetCombo event, Emitter<QuestionState> emit) {
    emit(state.copyWith(combo: state.combo + 1));
  }

  FutureOr<void> _changePauseStatus(
      ChangePauseStatus event, Emitter<QuestionState> emit) {
    emit(state.copyWith(isPause: event.pauseStatus));
  }

  @override
  QuestionState? fromJson(Map<String, dynamic> json) {
    return QuestionState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(QuestionState state) {
    return state.toJson();
  }
}
