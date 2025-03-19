import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/data/models/enums/language_type.dart';

part 'setting_state.g.dart';

@JsonSerializable()
@CopyWith()
class SettingState extends Equatable {
  final bool isSoundtrack;
  final bool isSoundEffects;
  final bool isHighGraphics;
  final bool isVibrate;
  final LanguageType language;
  const SettingState({
    this.isSoundtrack = false,
    this.isSoundEffects = false,
    this.isHighGraphics = false,
    this.isVibrate = false,
    this.language = LanguageType.en,
  });

  @override
  List<Object> get props =>
      [isSoundtrack, isSoundEffects, isHighGraphics, isVibrate, language];
  factory SettingState.fromJson(Map<String, dynamic> json) =>
      _$SettingStateFromJson(json);
  Map<String, dynamic> toJson() => _$SettingStateToJson(this);
}
