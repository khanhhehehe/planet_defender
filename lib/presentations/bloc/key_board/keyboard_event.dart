part of 'keyboard_bloc.dart';

sealed class KeyboardEvent extends Equatable {
  const KeyboardEvent();
  @override
  List<Object> get props => [];
}

class ChangeValueKeyboard extends KeyboardEvent {
  final String value;
  const ChangeValueKeyboard({required this.value});
  @override
  List<Object> get props => [value];
}
