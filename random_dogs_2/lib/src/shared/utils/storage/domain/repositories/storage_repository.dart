abstract class IStorageRepository {
  void save(dynamic data);
  void delete(dynamic datas);
  void update();
  Future<List<String>> read();
}
