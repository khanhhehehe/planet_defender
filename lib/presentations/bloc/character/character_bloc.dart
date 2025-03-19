import 'dart:async';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/character_type.dart';
import 'package:planet_defender/data/models/enums/level_type.dart';
import 'package:planet_defender/domain/use_cases/select_character.dart';
import 'package:planet_defender/presentations/bloc/character/character_state.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'character_event.dart';

@lazySingleton
class CharacterBloc extends HydratedBloc<CharacterEvent, CharacterState> {
  final SelectCharacterUseCase _characterUseCase;
  CharacterBloc()
      : _characterUseCase = dI<SelectCharacterUseCase>(),
        super(const CharacterState()) {
    on<SetCharacter>(_setCharacter);
    on<ChangeTab>(_changeTab);
    on<SelectAcademic>(_selectAcademic);
    on<SelectIelts>(_selectIelts);
    on<SelectCharacter>(_selectCharacter);
  }

  FutureOr<void> _setCharacter(
      SetCharacter event, Emitter<CharacterState> emit) async {
    emit(state.copyWith(character: event.character));
  }

  FutureOr<void> _changeTab(
      ChangeTab event, Emitter<CharacterState> emit) async {
    emit(state.copyWith(selectTabLevelType: event.type));
  }

  FutureOr<void> _selectAcademic(
      SelectAcademic event, Emitter<CharacterState> emit) async {
    emit(state.copyWith(academicType: event.type));
  }

  FutureOr<void> _selectIelts(
      SelectIelts event, Emitter<CharacterState> emit) async {
    emit(state.copyWith(ieltsType: event.type));
  }

  FutureOr<void> _selectCharacter(
      SelectCharacter event, Emitter<CharacterState> emit) async {
    String gender = state.character == CharacterType.cosmo
        ? GenderType.male.name
        : GenderType.female.name;

    try {
      String level = '';
      if (state.academicType == AcademicType.unknown &&
          state.ieltsType != IeltsType.unknown) {
        level = state.ieltsType.displayName;
      } else if (state.academicType != AcademicType.unknown &&
          state.ieltsType == IeltsType.unknown) {
        level = state.academicType.name.split(" ").first;
      } else {
        emit(state.copyWith(status: CharacterStatus.failed));
        return;
      }
      await _characterUseCase.selectCharacter(gender);
      await _characterUseCase.selectLevel(level);
      emit(state.copyWith(status: CharacterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CharacterStatus.failed));
    }
  }

  @override
  CharacterState fromJson(Map<String, dynamic> json) {
    return CharacterState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CharacterState state) {
    return state.toJson();
  }
}
