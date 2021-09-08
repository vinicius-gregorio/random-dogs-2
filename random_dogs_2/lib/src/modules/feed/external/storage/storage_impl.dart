import 'package:random_dogs_2/src/shared/utils/storage/domain/controllers/storage_controller.dart';
import 'package:random_dogs_2/src/shared/utils/storage/external/hive_repository.dart';

class StorageImpl {
  final storageController = StorageController(HiveRepository());
  void save(dynamic data) async {
    storageController.repository.save(data);
  }
}
