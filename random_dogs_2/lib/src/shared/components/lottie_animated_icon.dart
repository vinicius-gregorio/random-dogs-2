import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimatedIcon extends StatelessWidget {
  final String iconUrl;
  final double height;
  final double width;
  const LottieAnimatedIcon(
      {Key? key, required this.iconUrl, this.height = 50, this.width = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Lottie.network(iconUrl),
    );
  }
}
