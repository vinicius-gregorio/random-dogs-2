import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/favorites/favorites_controller.dart';
import 'package:random_dogs_2/src/modules/favorites/ui/components/grid_item.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);

  final controller = FavoritesController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<String>>(
          future: controller.storageController.repository.read(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (_, index) {
                    return GridItem(imageUrl: snapshot.data?[index]);
                  });
            }
            return Container();
          }),
    );
  }
}
