import 'package:planet_defender/domain/entities/meteorite.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'meteorite_state.g.dart';

@CopyWith()
class MeteoriteState extends Equatable {
  final String meteoriteSelected;
  final List<Meteorite> listMeteorite;

  const MeteoriteState({
    this.meteoriteSelected = "",
    this.listMeteorite = const [],
  });

  @override
  List<Object> get props => [meteoriteSelected];
}

final class MeteoriteInitial extends MeteoriteState {}
