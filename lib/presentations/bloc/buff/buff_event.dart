part of 'buff_bloc.dart';

sealed class BuffEvent extends Equatable {
  const BuffEvent();

  @override
  List<Object> get props => [];
}

class SetBuff extends BuffEvent {
  final ZBuffType type;
  const SetBuff({
    required this.type,
  });

  @override
  List<Object> get props => [type];
}

class AddBuff extends BuffEvent {
  final ZBuffType type;
  const AddBuff({
    required this.type,
  });

  @override
  List<Object> get props => [type];
}

class DeleteBuff extends BuffEvent {
  const DeleteBuff();
  @override
  List<Object> get props => [];
}

class InitBuff extends BuffEvent {
  final ZBuffType type;
  const InitBuff({
    required this.type,
  });

  @override
  List<Object> get props => [type];
}

class SetCountZMaster extends BuffEvent {
  final int item;
  const SetCountZMaster({required this.item});
  @override
  List<Object> get props => [item];
}

class DeleteAllBuff extends BuffEvent {
  const DeleteAllBuff();
  @override
  List<Object> get props => [];
}
