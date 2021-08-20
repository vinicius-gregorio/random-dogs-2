import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';
import 'package:random_dogs_2/src/modules/feed/feed_controller.dart';
import 'package:random_dogs_2/src/modules/feed/ui/components/feed_item_component.dart';
import 'package:random_dogs_2/src/shared/components/lottie_animated_icon.dart';
import 'package:random_dogs_2/src/theme/app_animations.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
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
                    itemScrollController: controller.itemScrollController,
                    physics: NeverScrollableScrollPhysics(),
                    itemPositionsListener: controller.itemPositionsListener,
                    itemCount: snapshot.data!.photo!.length,
                    itemBuilder: (__, index) {
                      return GestureDetector(
                        onVerticalDragUpdate: (drag) {
                          if (drag.primaryDelta! < 0) {
                            controller.scrollToNext(index: index);
                          } else {
                            //ensure that index is not negative
                            if (index - 1 < 0) {
                              return;
                            }
                            controller.scrollToPrevious(index: index);
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                                height: maxHeight,
                                child: FeedItem(photo: dogPhotos[index])),
                            Positioned(
                                bottom: maxHeight * 0.02,
                                left: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    controller.scrollToNext(index: index);
                                  },
                                  child: LottieAnimatedIcon(
                                    iconUrl: LottieAnimations.arrowDownPump,
                                    height: 70,
                                  ),
                                )),
                          ],
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );
    });
  }
}
