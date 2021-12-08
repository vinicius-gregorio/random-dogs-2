import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_dogs_2/src/shared/components/lottie_animated_icon.dart';
import 'package:random_dogs_2/src/theme/app_animations.dart';
import 'package:random_dogs_2/src/theme/app_colors.dart';

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
            bottom: maxHeight * 0.1,
            right: maxHeight * 0.01,
            child: Container(
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.saveImage(dogPhotos[index], context);
                      },
                      icon: Icon(
                        Icons.favorite_outline,
                        size: 30,
                        color: AppColors.icon,
                      )),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  IconButton(
                      onPressed: () {
                        controller.copyImageToClipboard(
                            ClipboardData(text: dogPhotos[index]), context);
                      },
                      icon: Icon(
                        Icons.copy,
                        size: 30,
                        color: AppColors.icon,
                      )),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  IconButton(
                      onPressed: () {
                        controller.shareImage(dogPhotos[index], context);
                      },
                      icon: Icon(
                        Icons.send_outlined,
                        size: 30,
                        color: AppColors.icon,
                      )),
                ],
              ),
            )),
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
                height: maxHeight * 0.08,
                width: 30,
              ),
            )),
      ],
    );
  }
}
