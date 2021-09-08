import 'package:flutter_test/flutter_test.dart';
import 'package:random_dogs_2/src/shared/utils/storage/domain/controllers/storage_controller.dart';
import 'package:random_dogs_2/src/shared/utils/storage/external/hive_repository.dart';

void main() {
  test('should save an item', () {
    final storageController = StorageController(HiveRepository());
    var item = {'name': 'any_name', 'id': 'any_id'};
    storageController.repository.save(item);
  });
}
