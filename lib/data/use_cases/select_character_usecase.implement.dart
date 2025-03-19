import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/domain/repositories/select_character.repository.dart';
import 'package:planet_defender/domain/use_cases/select_character.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SelectCharacterUseCase)
class SelectCharacterUseCaseImpl extends SelectCharacterUseCase {
  final SelectCharacterRepository _repository;
  SelectCharacterUseCaseImpl() : _repository = dI<SelectCharacterRepository>();

  @override
  Future<void> selectCharacter(String gender) async {
    await _repository.selectCharacter(gender);
  }

  @override
  Future<void> selectLevel(String level) async {
    await _repository.selectLevel(level);
  }
}
