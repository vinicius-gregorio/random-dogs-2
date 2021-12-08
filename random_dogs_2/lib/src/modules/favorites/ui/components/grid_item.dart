import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/theme/app_colors.dart';

class GridItem extends StatelessWidget {
  final imageUrl;
  final VoidCallback onPressShare;
  GridItem({Key? key, required this.imageUrl, required this.onPressShare})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      print('pressed unfavorite');
                    },
                    icon: Icon(
                      Icons.favorite_outline,
                      size: 30,
                      color: AppColors.icon,
                    )),
                IconButton(
                    onPressed: onPressShare,
                    icon: Icon(
                      Icons.send_outlined,
                      size: 30,
                      color: AppColors.icon,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
