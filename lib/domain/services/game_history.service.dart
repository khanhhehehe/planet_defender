import 'package:planet_defender/data/models/request/game_history_request.dart';
import 'package:planet_defender/data/models/response/game_history_response.dart';

abstract class GameHistoryService {
  Future<String> saveGameHistory(
      {required GameHistoryRequest gameHistoryRequest});
  Future<GameHistoryResponse> getGameHistory({required String gameHistoryId});
}
