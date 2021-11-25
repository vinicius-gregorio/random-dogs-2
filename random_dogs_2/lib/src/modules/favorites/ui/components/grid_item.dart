import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/theme/app_colors.dart';

class GridItem extends StatelessWidget {
  final imageUrl;
  GridItem({Key? key, required this.imageUrl}) : super(key: key);

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
                    onPressed: () {
                      print('pressed share');
                    },
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
