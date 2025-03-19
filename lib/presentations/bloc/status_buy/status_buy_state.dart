import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status_buy_state.g.dart';

enum StatusBuy {
  init,
  start,
  success,
  error,
}

@JsonSerializable()
@CopyWith()
class StatusBuyState extends Equatable {
  final StatusBuy status;
  final int price;
  final bool showSnackBar;
  const StatusBuyState(
      {this.status = StatusBuy.init,
      this.price = 0,
      this.showSnackBar = false});

  @override
  List<Object> get props => [status, price];
  factory StatusBuyState.fromJson(Map<String, dynamic> json) =>
      _$StatusBuyStateFromJson(json);
  Map<String, dynamic> toJson() => _$StatusBuyStateToJson(this);
}
