import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/shared/components/lottie_animated_icon.dart';
import 'package:random_dogs_2/src/theme/app_animations.dart';

import '../../feed_controller.dart';
import 'feed_item_component.dart';

class ScrollableItem extends StatelessWidget {
  const ScrollableItem({
    Key? key,
    required this.maxHeight,
    required this.dogPhotos,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final double maxHeight;
  final List<String> dogPhotos;
  final FeedController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: maxHeight, child: FeedItem(photo: dogPhotos[index])),
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
    );
  }
}
