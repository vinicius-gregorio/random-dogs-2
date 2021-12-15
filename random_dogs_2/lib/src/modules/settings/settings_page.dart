import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/theme/app_images.dart';
import 'package:random_dogs_2/src/theme/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              Text(
                'Random dogs needs your help !',
                style: headline2,
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  width: MediaQuery.of(context).size.width * 0.95,
                  image: AssetImage(AppImages.fluffyDogImage),
                ),
              ),
              Text(
                'All the earnings coming from this app go to non governamental organizations to help homeless dogs',
                style: headline3,
              ),
              TextButton(
                  onPressed: () {},
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text('Click and help a dog'))),
            ],
          ),
        ),
      ),
    );
  }
}
