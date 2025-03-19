abstract class SelectCharacterRepository {
  Future<void> selectCharacter(String gender);
  Future<void> selectLevel(String level);
}
