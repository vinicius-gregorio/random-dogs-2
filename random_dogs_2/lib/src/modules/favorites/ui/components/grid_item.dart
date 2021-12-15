import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final imageUrl;
  final VoidCallback onPressShare;
  final VoidCallback onPressUnfavorite;

  GridItem(
      {Key? key,
      required this.imageUrl,
      required this.onPressShare,
      required this.onPressUnfavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Container(dsa
          //   height: 50,
          //   margin: const EdgeInsets.only(bottom: 15),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       IconButton(
          //           onPressed: onPressUnfavorite,
          //           icon: Icon(
          //             Icons.favorite_outline,
          //             size: 30,
          //             color: AppColors.icon,
          //           )),
          //       IconButton(
          //           onPressed: onPressShare,
          //           icon: Icon(
          //             Icons.send_outlined,
          //             size: 30,
          //             color: AppColors.icon,
          //           )),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
