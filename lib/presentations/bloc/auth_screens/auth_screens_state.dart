import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_screens_state.g.dart';

@CopyWith()
@JsonSerializable()
class AuthScreensState extends Equatable {
  final AuthenticationScreensType status;

  const AuthScreensState({
    this.status = AuthenticationScreensType.login,
  });

  @override
  List<Object> get props => [status];

  factory AuthScreensState.fromJson(Map<String, dynamic> json) =>
      _$AuthScreensStateFromJson(json);
  Map<String, dynamic> toJson() => _$AuthScreensStateToJson(this);
}
