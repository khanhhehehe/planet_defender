import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/domain/use_cases/spaceship_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/presentations/bloc/market_place/spaceships/spaceships_state.dart';
import 'package:planet_defender/presentations/bloc/status_buy/status_buy_bloc.dart';
import 'package:planet_defender/presentations/bloc/status_buy/status_buy_state.dart';

part 'spaceships_event.dart';

@lazySingleton
class SpaceshipsBloc extends HydratedBloc<SpaceshipsEvent, SpaceshipsState> {
  final SpaceshipUseCase _spaceShipUseCase;
  SpaceshipsBloc()
      : _spaceShipUseCase = dI<SpaceshipUseCase>(),
        super(const SpaceshipsState()) {
    on<GetSpaceships>(_getSpaceships);
    on<BuySpaceship>(_buySpaceship);
  }

  Future<FutureOr<void>> _getSpaceships(
      GetSpaceships event, Emitter<SpaceshipsState> emit) async {
    try {
      emit(state.copyWith(status: SpaceshipsStatus.start));
      final result = await _spaceShipUseCase.getSpaceships();
      emit(state.copyWith(
          spaceShips: result.spaceShips,
          spaceShipIds: result.spaceShipIds,
          status: SpaceshipsStatus.success));
      dI<StatusBuyBloc>()
          .add(const ChangeStatusBuy(statusBuy: StatusBuy.success));
    } catch (e) {
      emit(state.copyWith(status: SpaceshipsStatus.error));
      dI<StatusBuyBloc>()
          .add(const ChangeStatusBuy(statusBuy: StatusBuy.error));
    }
  }

  @override
  SpaceshipsState? fromJson(Map<String, dynamic> json) {
    return SpaceshipsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SpaceshipsState state) {
    return state.toJson();
  }

  Future<FutureOr<void>> _buySpaceship(
      BuySpaceship event, Emitter<SpaceshipsState> emit) async {
    emit(state.copyWith(status: SpaceshipsStatus.start));
    try {
      await _spaceShipUseCase.buySpaceship(spaceShip: event.spaceShip);
      emit(state.copyWith(status: SpaceshipsStatus.success));
      dI<SpaceshipsBloc>().add(const GetSpaceships());
    } catch (e) {
      emit(state.copyWith(status: SpaceshipsStatus.error));
    }
  }
}
