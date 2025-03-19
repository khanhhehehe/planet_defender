part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserInfo extends UserEvent {
  const GetUserInfo();

  @override
  List<Object> get props => [];
}

class SaveNickName extends UserEvent {
  final String nickname;
  const SaveNickName({
    required this.nickname,
  });

  @override
  List<Object> get props => [nickname];
}

class Init extends UserEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class SaveAcademicLevel extends UserEvent {
  final String level;
  const SaveAcademicLevel({this.level = ''});
  @override
  List<Object> get props => [level];
}
