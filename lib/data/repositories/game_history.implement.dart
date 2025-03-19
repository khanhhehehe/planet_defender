import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/request/game_history_request.dart';
import 'package:planet_defender/data/models/response/game_history_response.dart';
import 'package:planet_defender/domain/repositories/game_history.dart';
import 'package:planet_defender/domain/services/game_history.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GameHistoryRepository)
class GameHistoryImpl extends GameHistoryRepository {
  final GameHistoryService _service;

  GameHistoryImpl() : _service = dI<GameHistoryService>();

  @override
  Future<String> saveGameHistory(
      {required GameHistoryRequest gameHistoryRequest}) async {
    return await _service.saveGameHistory(
        gameHistoryRequest: gameHistoryRequest);
  }

  @override
  Future<GameHistoryResponse> getGameHistory(
      {required String gameHistoryId}) async {
    return await _service.getGameHistory(gameHistoryId: gameHistoryId);
  }
}
