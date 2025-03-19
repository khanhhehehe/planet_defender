import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/domain/use_cases/wiki_zbuff_usecase.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/z_buff/wiki_z_buff_state.dart';

part 'wiki_z_buff_event.dart';

@lazySingleton
class WikiZBuffBloc extends Bloc<WikiZBuffEvent, WikiZBuffState> {
  final WikiZBuffUseCase _zBuffUseCase;
  WikiZBuffBloc()
      : _zBuffUseCase = dI<WikiZBuffUseCase>(),
        super(const WikiZBuffState()) {
    on<GetZBuff>(_getZBuffs);
  }

  Future<FutureOr<void>> _getZBuffs(
      GetZBuff event, Emitter<WikiZBuffState> emit) async {
    try {
      emit(state.copyWith(wikiZBuffStatus: WikiZBuffStatus.start));
      final result = await _zBuffUseCase.getZBuff();
      emit(state.copyWith(
          zbuffs: result.zBuffs,
          zbuffIds: result.zBuffIds,
          wikiZBuffStatus: WikiZBuffStatus.success));
    } catch (e) {
      emit(state.copyWith(wikiZBuffStatus: WikiZBuffStatus.error));
    }
  }
}
