import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'keyboard_state.g.dart';

@CopyWith()
class KeyboardState extends Equatable {
  final String value;
  const KeyboardState({this.value = ""});

  @override
  List<Object> get props => [value];
}

final class KeyboardInitial extends KeyboardState {}
