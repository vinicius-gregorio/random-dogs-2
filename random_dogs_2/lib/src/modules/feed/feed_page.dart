import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';
import 'package:random_dogs_2/src/modules/feed/feed_controller.dart';
import 'package:random_dogs_2/src/modules/feed/ui/components/feed_item_component.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

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
            future: controller.getPhotos(LoadFeedParams(numberOfPhotos: 10)),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final dogPhotos = snapshot.data!.photo!;
                return ScrollablePositionedList.builder(
                    itemScrollController: _itemScrollController,
                    itemPositionsListener: _itemPositionsListener,
                    itemCount: snapshot.data!.photo!.length,
                    itemBuilder: (__, index) {
                      return GestureDetector(
                        onVerticalDragUpdate: (drag) {
                          if (drag.primaryDelta! < 0) {
                            _itemScrollController.scrollTo(
                                index: index + 1,
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeInOutCubic);
                          } else {
                            //ensure that index is not negative
                            if (index - 1 < 0) {
                              return;
                            }
                            _itemScrollController.scrollTo(
                                index: index - 1,
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeInOutCubic);
                          }
                        },
                        child: Container(
                            height: maxHeight,
                            child: FeedItem(photo: dogPhotos[index])),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );
    });
  }
}
