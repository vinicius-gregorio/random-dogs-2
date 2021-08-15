import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/feed_page.dart';
import 'package:random_dogs_2/src/shared/boilerplates/page_boilerplate.dart';

final List<Widget> homePagesList = [
  BoilerPlatePage(title: 'Favorites'),
  FeedPage(),
  BoilerPlatePage(title: 'Account'),
];
