import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'countdown_time_state.g.dart';

enum StandaloneStatus {
  init,
  start,
  success,
  fail,
}

@CopyWith()
class CountdownTimeState extends Equatable {
  final StandaloneStatus countTimeStatus;
  final int? executionTime;

  const CountdownTimeState({
    this.countTimeStatus = StandaloneStatus.init,
    this.executionTime = 0,
  });

  @override
  List<Object?> get props => [countTimeStatus, executionTime];
}
