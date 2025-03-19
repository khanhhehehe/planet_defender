import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/presentations/bloc/status_buy/status_buy_state.dart';

part 'status_buy_event.dart';

@lazySingleton
class StatusBuyBloc extends Bloc<StatusBuyEvent, StatusBuyState> {
  StatusBuyBloc() : super(const StatusBuyState()) {
    on<ChangeStatusBuy>(_changeStatusBuy);
    on<SetPrice>(_setPrice);
    on<ChangeStatusShowSnackBar>(_changeStatusSnackBar);
  }

  FutureOr<void> _changeStatusBuy(
      ChangeStatusBuy event, Emitter<StatusBuyState> emit) {
    emit(state.copyWith(status: event.statusBuy));
  }

  FutureOr<void> _setPrice(SetPrice event, Emitter<StatusBuyState> emit) {
    emit(state.copyWith(price: event.price));
  }

  FutureOr<void> _changeStatusSnackBar(
      ChangeStatusShowSnackBar event, Emitter<StatusBuyState> emit) {
    emit(state.copyWith(showSnackBar: event.statusSnackBar));
  }
}
