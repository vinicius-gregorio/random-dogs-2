import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';
import 'package:random_dogs_2/src/modules/feed/feed_controller.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<String>? dogsPhotosList;
  // @override
  // void initState() async {
  //   dogsPhotosList =
  //       await controller.getPhotos(LoadFeedParams(numberOfPhotos: 50));
  //   super.initState();
  // }

  final controller = FeedController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<DogResponse?>(
          future: controller.getPhotos(LoadFeedParams(numberOfPhotos: 50)),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final dogPhotos = snapshot.data!.photo!;
              return Container(
                child: ListView.builder(
                    itemCount: snapshot.data?.photo?.length,
                    itemBuilder: (__, index) {
                      return Image.network(dogPhotos[index]);
                    }),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
