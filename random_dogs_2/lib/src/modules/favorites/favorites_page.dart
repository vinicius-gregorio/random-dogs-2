import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/favorites/favorites_controller.dart';
import 'package:random_dogs_2/src/modules/favorites/ui/components/grid_item.dart';
import 'package:random_dogs_2/src/modules/feed/feed_controller.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);

  final controller = FavoritesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Container(
        child: FutureBuilder<List<String>>(
            future: controller.storageController.repository.read(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (_, index) {
                      return GridItem(
                          imageUrl: snapshot.data?[index],
                          onPressUnfavorite: () => controller.deleteImage(
                              snapshot.data![index], context),
                          onPressShare: () => controller.shareImage(
                              snapshot.data![index], context));
                    });
              }
              return Container(
                child: Text('Dog.'),
              );
            }),
      ),
    );
  }
}
