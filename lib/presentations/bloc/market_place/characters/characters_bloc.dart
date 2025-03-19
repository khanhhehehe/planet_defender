import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/domain/use_cases/character_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/presentations/bloc/market_place/characters/characters_state.dart';
import 'package:planet_defender/presentations/bloc/status_buy/status_buy_bloc.dart';
import 'package:planet_defender/presentations/bloc/status_buy/status_buy_state.dart';

part 'characters_event.dart';

@lazySingleton
class CharactersBloc extends HydratedBloc<CharactersEvent, CharactersState> {
  final CharacterUseCase _characterUseCase;
  CharactersBloc()
      : _characterUseCase = dI<CharacterUseCase>(),
        super(const CharactersState()) {
    on<GetCharacters>(_getCharacters);
    on<BuyCharacter>(_buyCharacter);
  }

  Future<FutureOr<void>> _getCharacters(
      GetCharacters event, Emitter<CharactersState> emit) async {
    try {
      emit(state.copyWith(status: CharactersStatus.start));
      final result = await _characterUseCase.getCharacters();
      emit(state.copyWith(
          characters: result.characters,
          characterIds: result.characterIds,
          status: CharactersStatus.success));
      dI<StatusBuyBloc>()
          .add(const ChangeStatusBuy(statusBuy: StatusBuy.success));
    } catch (e) {
      emit(state.copyWith(status: CharactersStatus.error));
    }
  }

  @override
  CharactersState? fromJson(Map<String, dynamic> json) {
    return CharactersState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CharactersState state) {
    return state.toJson();
  }

  Future<FutureOr<void>> _buyCharacter(
      BuyCharacter event, Emitter<CharactersState> emit) async {
    try {
      emit(state.copyWith(status: CharactersStatus.start));
      await _characterUseCase.buyCharacter(characterId: event.characterId);
      emit(state.copyWith(status: CharactersStatus.success));
      dI<CharactersBloc>().add(const GetCharacters());
    } catch (e) {
      emit(state.copyWith(status: CharactersStatus.error));
      dI<StatusBuyBloc>()
          .add(const ChangeStatusBuy(statusBuy: StatusBuy.error));
    }
  }
}
