import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/favorites/favorites_controller.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);

  final controller = FavoritesController();

  @override
  Widget build(BuildContext context) {
    print(controller.storageController.repository.read());
    return Container(
      child: FutureBuilder(
          future: controller.storageController.repository.read(),
          builder: (_, snapshot) {
            return Text(snapshot.data.toString());
          }),
    );
  }
}
