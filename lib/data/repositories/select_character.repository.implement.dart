import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/domain/repositories/select_character.repository.dart';
import 'package:planet_defender/domain/services/select_character_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SelectCharacterRepository)
class SelectCharacterRepositoryImpl extends SelectCharacterRepository {
  final SelectCharacterService _service;
  SelectCharacterRepositoryImpl() : _service = dI<SelectCharacterService>();

  @override
  Future<void> selectCharacter(String gender) async {
    await _service.selectCharacter(gender);
  }

  @override
  Future<void> selectLevel(String level) async {
    await _service.selectLevel(level);
  }
}
