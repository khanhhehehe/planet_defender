part of 'personal_info_bloc.dart';

sealed class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();

  @override
  List<Object> get props => [];
}

class GetPersonalInfo extends PersonalInfoEvent {
  const GetPersonalInfo();

  @override
  List<Object> get props => [];
}

class SavePersonalInfo extends PersonalInfoEvent {
  final String nickname;
  const SavePersonalInfo({
    required this.nickname,
  });

  @override
  List<Object> get props => [nickname];
}

class InitPersonalInfo extends PersonalInfoEvent {
  final String studentId;
  const InitPersonalInfo({required this.studentId});

  @override
  List<Object> get props => [studentId];
}

class ChangeTab extends PersonalInfoEvent {
  final FinalTabType type;
  const ChangeTab({required this.type});

  @override
  List<Object> get props => [type];
}
