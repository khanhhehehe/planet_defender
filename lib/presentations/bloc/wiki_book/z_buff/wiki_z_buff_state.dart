import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:planet_defender/domain/entities/zbuffs_type.dart';

part 'wiki_z_buff_state.g.dart';

enum WikiZBuffStatus { init, start, success, error }

@CopyWith()
class WikiZBuffState extends Equatable {
  final Map<String, ZBuffsType> zbuffs;
  final List<String> zbuffIds;
  final WikiZBuffStatus wikiZBuffStatus;
  const WikiZBuffState(
      {this.zbuffs = const {},
      this.zbuffIds = const [],
      this.wikiZBuffStatus = WikiZBuffStatus.init});

  @override
  List<Object> get props => [zbuffs, zbuffIds, wikiZBuffStatus];
}

final class WikiBookInit extends WikiZBuffState {}
