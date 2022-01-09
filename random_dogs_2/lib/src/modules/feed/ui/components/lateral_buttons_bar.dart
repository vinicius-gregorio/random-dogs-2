import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_dogs_2/src/modules/feed/feed_controller.dart';
import 'package:random_dogs_2/src/theme/app_colors.dart';

class LateralButtonsBar extends StatelessWidget {
  final controller = FeedController();
  final String photo;
  LateralButtonsBar({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // IconButton(
          //     onPressed: () {
          //       controller.saveImage(photo, context);
          //     },
          //     icon: Icon(
          //       Icons.favorite_outline,
          //       size: 30,
          //       color: AppColors.icon,
          //     )),
          Padding(padding: EdgeInsets.only(top: 5)),
          IconButton(
              onPressed: () {
                controller.copyImageToClipboard(
                    ClipboardData(text: photo), context);
              },
              icon: Icon(
                Icons.copy,
                size: 30,
                color: AppColors.icon,
              )),
          Padding(padding: EdgeInsets.only(top: 5)),
          IconButton(
              onPressed: () {
                controller.shareImage(photo, context);
              },
              icon: Icon(
                Icons.send_outlined,
                size: 30,
                color: AppColors.icon,
              )),
        ],
      ),
    );
  }
}
