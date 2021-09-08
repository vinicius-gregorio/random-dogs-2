abstract class IStorageRepository {
  void save();
  void delete();
  void update();
  Future read();
}
