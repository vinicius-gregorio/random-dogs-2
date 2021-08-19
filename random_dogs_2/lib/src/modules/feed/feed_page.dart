import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';
import 'package:random_dogs_2/src/modules/feed/feed_controller.dart';
import 'package:random_dogs_2/src/modules/feed/ui/components/feed_item_component.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  ScrollController _scrollController = ScrollController();
  final controller = FeedController();

  @override
  void initState() {
    super.initState();
  }

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
                    shrinkWrap: true,
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
