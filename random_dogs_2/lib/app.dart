import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/ui/feed_page.dart';
import 'package:random_dogs_2/src/theme/app_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Dogs 2',
      theme: appTheme(),
      home: FeedPage(),
    );
  }
}
