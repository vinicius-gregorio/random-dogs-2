import 'package:flutter/material.dart';

class BoilerPlatePage extends StatelessWidget {
  BoilerPlatePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BoilerPlate Page'),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
