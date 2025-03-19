import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/data/models/enums/z_buff_types.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_state.dart';

part 'buff_event.dart';

@lazySingleton
class BuffBloc extends Bloc<BuffEvent, BuffState> {
  BuffBloc() : super(BuffInitial()) {
    on<SetBuff>(_setBuff);
    on<AddBuff>(_addBuff);
    on<DeleteBuff>(_deleteBuff);
    on<SetCountZMaster>(_setCountZMaster);
    on<DeleteAllBuff>(_deleteAllBuff);
  }

  FutureOr<void> _setBuff(SetBuff event, Emitter<BuffState> emit) {
    emit(state.copyWith(zBuffType: event.type));
  }

  FutureOr<void> _addBuff(AddBuff event, Emitter<BuffState> emit) {
    if (event.type == ZBuffType.coin1 ||
        event.type == ZBuffType.coin2 ||
        event.type == ZBuffType.coin3) {
    } else {
      if (state.listZBuff.length < 4) {
        List<ZBuffType> newListBuff = [...state.listZBuff, event.type];
        emit(state.copyWith(listZBuff: newListBuff));
      } else {
        List<ZBuffType> newListBuff = [...state.listZBuff, event.type];
        newListBuff.removeAt(0);
        emit(state.copyWith(listZBuff: newListBuff));
      }
    }
  }

  FutureOr<void> _deleteBuff(DeleteBuff event, Emitter<BuffState> emit) {
    final index =
        state.listZBuff.indexWhere((element) => element == state.zBuffType);
    List<ZBuffType> list = state.listZBuff;
    list.removeAt(index);
    emit(state.copyWith(zBuffType: ZBuffType.unknown, listZBuff: list));
  }

  FutureOr<void> _setCountZMaster(
      SetCountZMaster event, Emitter<BuffState> emit) {
    if (event.item == 0) {
      emit(state.copyWith(totalZMaster: 0));
    } else {
      emit(state.copyWith(totalZMaster: state.totalZMaster + event.item));
    }
  }

  FutureOr<void> _deleteAllBuff(
      DeleteAllBuff event, Emitter<BuffState> emit) {
    emit(state.copyWith(zBuffType: ZBuffType.unknown, listZBuff: []));
  }
}
