import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/data/models/enums/language_type.dart';
import 'package:planet_defender/presentations/bloc/setting/setting_state.dart';

part 'setting_event.dart';

@lazySingleton
class SettingBloc extends HydratedBloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState()) {
    on<SetSoundtrack>(_setSoundtrack);
    on<SetSoundEffects>(_setSoundEffects);
    on<SetHighGraphics>(_setHighGraphics);
    on<SetVibrate>(_setVibrate);
    on<SetLanguage>(_setLanguage);
  }
  void _setSoundtrack(SetSoundtrack event, Emitter<SettingState> emit) async {
    emit(state.copyWith(isSoundtrack: !state.isSoundtrack));
  }

  void _setSoundEffects(
      SetSoundEffects event, Emitter<SettingState> emit) async {
    emit(state.copyWith(isSoundEffects: !state.isSoundEffects));
  }

  void _setHighGraphics(
      SetHighGraphics event, Emitter<SettingState> emit) async {
    emit(state.copyWith(isHighGraphics: !state.isHighGraphics));
  }

  void _setVibrate(SetVibrate event, Emitter<SettingState> emit) async {
    emit(state.copyWith(isVibrate: !state.isVibrate));
  }

  void _setLanguage(SetLanguage event, Emitter<SettingState> emit) async {
    emit(state.copyWith(language: event.language));
  }

  @override
  SettingState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(SettingState state) {
    return null;
  }
}
