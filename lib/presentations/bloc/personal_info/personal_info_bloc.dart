import 'dart:async';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/final_tab_type.dart';
import 'package:planet_defender/domain/use_cases/personal_info_usecase.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'personal_info_event.dart';

@lazySingleton
class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  final PersonalInfoUseCase _personalInfoUseCase;
  PersonalInfoBloc()
      : _personalInfoUseCase = dI<PersonalInfoUseCase>(),
        super(PersonalInfoInit()) {
    on<InitPersonalInfo>(_init);
    on<ChangeTab>(_changeTab);
  }
  FutureOr<void> _init(
      InitPersonalInfo event, Emitter<PersonalInfoState> emit) async {
    try {
      emit(state.copyWith(status: GetPersonalInfoStatus.start));
      final result = await _personalInfoUseCase.getStudentDetail(
          studentId: event.studentId);
      emit(state.copyWith(
          avatarPath: result.avatarPath,
          characterOwned: result.characterOwned,
          currentRank: result.currentRank,
          exp: result.exp,
          level: result.level,
          name: result.name,
          spaceshipOwned: result.spaceshipOwned,
          totalExp: result.totalExp,
          totalGamePlay: result.totalGamePlay,
          fselCoin: result.fselCoin,
          accountType: result.accountType,
          code: result.code,
          battle: result.battle,
          combo: result.combo,
          destroyed: result.destroyed,
          playedTime: result.playedTime,
          season: result.season,
          totalScore: result.totalScore,
          zMatter: result.zMatter,
          gameHistoryIds: result.historyIds,
          gameHistory: result.gameHistory,
          avatarIds: result.avatarIds,
          avatars: result.avatars,
          tagIds: result.tagIds,
          tags: result.tags,
          status: GetPersonalInfoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: GetPersonalInfoStatus.failed));
    }
  }

  FutureOr<void> _changeTab(ChangeTab event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(tabType: event.type));
  }
}
