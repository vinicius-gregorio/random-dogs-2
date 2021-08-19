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
    return LayoutBuilder(builder: (context, constraints) {
      var maxHeight = constraints.maxHeight;
      return Container(
        child: FutureBuilder<DogResponse?>(
            future: controller.getPhotos(LoadFeedParams(numberOfPhotos: 30)),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final dogPhotos = snapshot.data!.photo!;
                return ListView.builder(
                    itemCount: snapshot.data?.photo?.length,
                    itemBuilder: (__, index) {
                      return Container(
                          height: maxHeight,
                          child: FeedItem(photo: dogPhotos[index]));
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );
    });
  }
}

class FeedItem extends StatelessWidget {
  final String photo;
  const FeedItem({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
      photo,
      fit: BoxFit.cover,
    ));
  }
}
