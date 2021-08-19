import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  final String photo;
  const FeedItem({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
      photo,
      fit: BoxFit.cover,
    ));
  }
}
