import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/data/models/enums/z_buff_types.dart';

part 'buff_state.g.dart';

@JsonSerializable()
@CopyWith()
class BuffState extends Equatable {
  final ZBuffType zBuffType;
  final List<ZBuffType> listZBuff;
  final int totalZMaster;

  const BuffState({
    this.zBuffType = ZBuffType.unknown,
    this.listZBuff = const [],
    this.totalZMaster = 0,
  });

  @override
  List<Object> get props => [zBuffType, listZBuff, totalZMaster];

  factory BuffState.fromJson(Map<String, dynamic> json) =>
      _$BuffStateFromJson(json);
  Map<String, dynamic> toJson() => _$BuffStateToJson(this);
}

final class BuffInitial extends BuffState {}
