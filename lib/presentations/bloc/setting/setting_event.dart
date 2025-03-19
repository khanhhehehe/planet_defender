part of 'setting_bloc.dart';

class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class SetSoundtrack extends SettingEvent {
  const SetSoundtrack();
}

class SetSoundEffects extends SettingEvent {
  const SetSoundEffects();
}

class SetHighGraphics extends SettingEvent {
  const SetHighGraphics();
}

class SetVibrate extends SettingEvent {
  const SetVibrate();
}

class SetLanguage extends SettingEvent {
  final LanguageType language;
  const SetLanguage({this.language = LanguageType.en});
}
