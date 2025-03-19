part of 'status_buy_bloc.dart';

sealed class StatusBuyEvent extends Equatable {
  const StatusBuyEvent();

  @override
  List<Object> get props => [];
}

class ChangeStatusBuy extends StatusBuyEvent {
  final StatusBuy statusBuy;
  const ChangeStatusBuy({required this.statusBuy});

  @override
  List<Object> get props => [statusBuy];
}

class SetPrice extends StatusBuyEvent {
  final int price;
  const SetPrice({required this.price});

  @override
  List<Object> get props => [price];
}

class ChangeStatusShowSnackBar extends StatusBuyEvent {
  final bool statusSnackBar;
  const ChangeStatusShowSnackBar({required this.statusSnackBar});

  @override
  List<Object> get props => [statusSnackBar];
}
