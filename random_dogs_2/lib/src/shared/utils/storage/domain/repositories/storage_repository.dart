abstract class IStorageRepository {
  void save(dynamic data);
  void delete();
  void update();
  Future<List<String>> read();
}
