import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/shared/utils/storage/domain/controllers/storage_controller.dart';
import 'package:random_dogs_2/src/shared/utils/storage/external/hive_repository.dart';
import 'package:share/share.dart';

class FavoritesController {
  final storageController = StorageController(HiveRepository());

  final snackBarFavorited = SnackBar(
    content: const Text('Favorited'),
  );
  final snackBarError = SnackBar(
    content: const Text('Error'),
  );

  void shareImage(String url, BuildContext context) async {
    try {
      Share.share('Look at this beautiful dog: $url');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarError);
    }
  }
}
