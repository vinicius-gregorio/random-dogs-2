import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_dogs_2/src/shared/utils/storage/domain/repositories/storage_repository.dart';

class HiveRepository implements IStorageRepository {
  var path = Directory.current.path;

  @override
  void delete() {
    // TODO: implement delete
  }

  @override
  Future read() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    if (!Hive.isBoxOpen('Favorites')) {
      Hive.init(appDocPath);
    }
    var box = Hive.box('Favorites');
    var values = box.toMap();
    print(values);
    return values;
  }

  @override
  void save(dynamic data) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    if (!Hive.isBoxOpen('Favorites')) {
      Hive.init(appDocPath);
    }

    var box = await Hive.openBox('Favorites');
    await box.add(data);
  }

  @override
  void update() {
    // TODO: implement update
  }
}
