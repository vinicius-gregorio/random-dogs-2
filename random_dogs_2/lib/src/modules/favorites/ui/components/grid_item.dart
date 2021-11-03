import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final imageUrl;
  GridItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
