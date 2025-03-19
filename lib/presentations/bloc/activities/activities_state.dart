import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/domain/entities/events_entity.dart';

part 'activities_state.g.dart';

enum ActivitiesGameStatus { init, start, success, error }

@JsonSerializable()
@CopyWith()
class ActivitiesState extends Equatable {
  final Map<String, EventsEntity> events;
  final List<String> eventIds;
  final ActivitiesGameStatus activitiesGameStatus;
  const ActivitiesState(
      {this.events = const {},
      this.eventIds = const [],
      this.activitiesGameStatus = ActivitiesGameStatus.init});

  @override
  List<Object> get props => [events, eventIds, activitiesGameStatus];
  factory ActivitiesState.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesStateFromJson(json);
  Map<String, dynamic> toJson() => _$ActivitiesStateToJson(this);
}
