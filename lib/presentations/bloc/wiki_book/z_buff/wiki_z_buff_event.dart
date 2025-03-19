part of 'wiki_z_buff_bloc.dart';

sealed class WikiZBuffEvent extends Equatable {
  const WikiZBuffEvent();
  @override
  List<Object> get props => [];
}
class GetZBuff extends WikiZBuffEvent {
  const GetZBuff();

  @override
  List<Object> get props => [];
}