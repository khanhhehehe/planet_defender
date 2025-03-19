// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActivitiesStateCWProxy {
  ActivitiesState activitiesGameStatus(
      ActivitiesGameStatus activitiesGameStatus);

  ActivitiesState eventIds(List<String> eventIds);

  ActivitiesState events(Map<String, EventsEntity> events);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActivitiesState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActivitiesState(...).copyWith(id: 12, name: "My name")
  /// ````
  ActivitiesState call({
    ActivitiesGameStatus? activitiesGameStatus,
    List<String>? eventIds,
    Map<String, EventsEntity>? events,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActivitiesState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActivitiesState.copyWith.fieldName(...)`
class _$ActivitiesStateCWProxyImpl implements _$ActivitiesStateCWProxy {
  final ActivitiesState _value;

  const _$ActivitiesStateCWProxyImpl(this._value);

  @override
  ActivitiesState activitiesGameStatus(
          ActivitiesGameStatus activitiesGameStatus) =>
      this(activitiesGameStatus: activitiesGameStatus);

  @override
  ActivitiesState eventIds(List<String> eventIds) => this(eventIds: eventIds);

  @override
  ActivitiesState events(Map<String, EventsEntity> events) =>
      this(events: events);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActivitiesState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActivitiesState(...).copyWith(id: 12, name: "My name")
  /// ````
  ActivitiesState call({
    Object? activitiesGameStatus = const $CopyWithPlaceholder(),
    Object? eventIds = const $CopyWithPlaceholder(),
    Object? events = const $CopyWithPlaceholder(),
  }) {
    return ActivitiesState(
      activitiesGameStatus:
          activitiesGameStatus == const $CopyWithPlaceholder() ||
                  activitiesGameStatus == null
              ? _value.activitiesGameStatus
              // ignore: cast_nullable_to_non_nullable
              : activitiesGameStatus as ActivitiesGameStatus,
      eventIds: eventIds == const $CopyWithPlaceholder() || eventIds == null
          ? _value.eventIds
          // ignore: cast_nullable_to_non_nullable
          : eventIds as List<String>,
      events: events == const $CopyWithPlaceholder() || events == null
          ? _value.events
          // ignore: cast_nullable_to_non_nullable
          : events as Map<String, EventsEntity>,
    );
  }
}

extension $ActivitiesStateCopyWith on ActivitiesState {
  /// Returns a callable class that can be used as follows: `instanceOfActivitiesState.copyWith(...)` or like so:`instanceOfActivitiesState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActivitiesStateCWProxy get copyWith => _$ActivitiesStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitiesState _$ActivitiesStateFromJson(Map<String, dynamic> json) =>
    ActivitiesState(
      events: (json['events'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, EventsEntity.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      eventIds: (json['eventIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      activitiesGameStatus: $enumDecodeNullable(
              _$ActivitiesGameStatusEnumMap, json['activitiesGameStatus']) ??
          ActivitiesGameStatus.init,
    );

Map<String, dynamic> _$ActivitiesStateToJson(ActivitiesState instance) =>
    <String, dynamic>{
      'events': instance.events,
      'eventIds': instance.eventIds,
      'activitiesGameStatus':
          _$ActivitiesGameStatusEnumMap[instance.activitiesGameStatus]!,
    };

const _$ActivitiesGameStatusEnumMap = {
  ActivitiesGameStatus.init: 'init',
  ActivitiesGameStatus.start: 'start',
  ActivitiesGameStatus.success: 'success',
  ActivitiesGameStatus.error: 'error',
};
