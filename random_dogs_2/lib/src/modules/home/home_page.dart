import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/home/components/bottom_nav_bar.dart/pages_list.dart';
import 'package:random_dogs_2/src/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homePagesList[controller.actualIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
        currentIndex: controller.actualIndex,
        onTap: (int index) {
          setState(() {
            controller.onTabTapped(index);
          });
        },
      ),
    );
  }
}
