import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/domain/entities/user.dart';
import 'package:planet_defender/domain/use_cases/user_usecase.dart';
import 'package:planet_defender/presentations/bloc/user/user_state.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';

@lazySingleton
class UserBloc extends HydratedBloc<UserEvent, UserState> {
  final UserUseCase _userUseCase;
  UserBloc()
      : _userUseCase = dI<UserUseCase>(),
        super(UserInitial()) {
    on<GetUserInfo>(_getUserInfo);
    on<SaveNickName>(_saveNickName);
    on<Init>(_init);
    on<SaveAcademicLevel>(_saveAcademicLevel);
  }

  Future<FutureOr<void>> _init(Init event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: CreateNicknameStatus.failed));
  }

  Future<FutureOr<void>> _getUserInfo(
      GetUserInfo event, Emitter<UserState> emit) async {
    User userModel = await _userUseCase.getUserInfo();
    emit(state.copyWith(userInfo: userModel));
  }

  Future<FutureOr<void>> _saveNickName(
      SaveNickName event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: CreateNicknameStatus.failed));
    try {
      await _userUseCase.saveNickName(
          nickName: event.nickname, id: state.userInfo.studentId);
      emit(state.copyWith(status: CreateNicknameStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreateNicknameStatus.failed));
    }
  }

  Future<FutureOr<void>> _saveAcademicLevel(
      SaveAcademicLevel event, Emitter<UserState> emit) async {
    emit(state.copyWith(levelStatus: CreateAcademicLevel.failed));
    try {
      await _userUseCase.saveAcademicLevel(level: event.level);
      emit(state.copyWith(levelStatus: CreateAcademicLevel.success));
    } catch (e) {
      emit(state.copyWith(levelStatus: CreateAcademicLevel.failed));
    }
  }
  
  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromJson(json);
  }
  
  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toJson();
  }
}
