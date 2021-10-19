import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/favorites/favorites_controller.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);

  final controller = FavoritesController();

  @override
  Widget build(BuildContext context) {
    print(controller.test);
    return Container();
  }
}
