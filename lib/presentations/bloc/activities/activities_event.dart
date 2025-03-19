part of 'activities_bloc.dart';

sealed class ActivitiesEvent extends Equatable {
  const ActivitiesEvent();

  @override
  List<Object> get props => [];
}

class GetActivities extends ActivitiesEvent {
  const GetActivities();
}
