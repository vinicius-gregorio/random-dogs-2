import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';
import 'package:random_dogs_2/src/modules/feed/feed_controller.dart';
import 'package:random_dogs_2/src/modules/feed/ui/components/scrollable_item_component.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'ui/components/pop_menu_component.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final controller = FeedController();
  Offset? offset;
  @override
  void initState() {
    super.initState();
    controller.itemPositionsListener.itemPositions.addListener(() {
      if (controller.itemPositionsListener.itemPositions.value.single.index ==
          controller.dogsPhotosList.length - 5) {
        controller.updateDogsImages(LoadFeedParams(numberOfPhotos: 10));

        setState(() {});
      } else {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final customPopMenu = CustomPopMenu(context: context, offset: offset);

    return LayoutBuilder(builder: (context, constraints) {
      var maxHeight = constraints.maxHeight;
      return Container(
        child: FutureBuilder<DogResponse?>(
            future: controller.getPhotos(LoadFeedParams(numberOfPhotos: 10)),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done ||
                  controller.dogsPhotosList.length > 1) {
                final dogPhotos = controller.dogsPhotosList;
                return ScrollablePositionedList.builder(
                    itemScrollController: controller.itemScrollController,
                    addAutomaticKeepAlives: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemPositionsListener: controller.itemPositionsListener,
                    itemCount: dogPhotos.length,
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
                        onLongPressStart: (long) async {
                          await showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(
                                long.globalPosition.dx,
                                long.globalPosition.dy,
                                100,
                                100),
                            items: [
                              PopupMenuItem(
                                value: 1,
                                child: Text("Save Image"),
                              ),
                            ],
                            elevation: 8.0,
                          ).then((value) {
                            if (value != null) {
                              if (value == 1) {
                                controller.saveImage(dogPhotos[index]);
                              }
                            }
                            ;
                          });
                        },
                        child: ScrollableItem(
                            maxHeight: maxHeight,
                            dogPhotos: dogPhotos,
                            controller: controller,
                            index: index),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro'));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container();
              }
            }),
      );
    });
  }
}
