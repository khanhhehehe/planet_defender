import 'package:planet_defender/data/models/enums/fire_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'fire_state.g.dart';

@CopyWith()
class FireState extends Equatable {
  final FireStatus fireStatus;

  const FireState({this.fireStatus = FireStatus.none});

  @override
  List<Object> get props => [fireStatus];
}

final class FireInitial extends FireState {}
