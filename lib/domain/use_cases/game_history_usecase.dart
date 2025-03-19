import 'package:planet_defender/data/models/request/game_history_request.dart';
import 'package:planet_defender/domain/entities/game_history.dart';

abstract class GameHistoryUseCase {
  Future<String> saveGameHistory({required GameHistoryRequest request});
  Future<GameHistory> getGameHistory({required String gameHistoryId});
}
