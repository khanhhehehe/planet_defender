import 'package:planet_defender/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'user_state.g.dart';

enum CreateNicknameStatus {
  success,
  failed,
}

enum CreateAcademicLevel {
  success,
  failed,
}

@JsonSerializable()
@CopyWith()
class UserState extends Equatable {
  final User userInfo;
  final CreateNicknameStatus status;
  final CreateAcademicLevel levelStatus;
  const UserState({
    this.status = CreateNicknameStatus.failed,
    this.userInfo = const User(),
    this.levelStatus = CreateAcademicLevel.failed,
  });

  @override
  List<Object> get props => [userInfo, status, levelStatus];
  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
  Map<String, dynamic> toJson() => _$UserStateToJson(this);
}

final class UserInitial extends UserState {}
