import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_dogs_2/src/modules/home/components/bottom_nav_bar.dart/pages_list.dart';
import 'package:random_dogs_2/src/modules/home/home_controller.dart';
import 'package:random_dogs_2/src/shared/helpers/ad_helper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  bool isBottomBannerLoaded = false;
  late BannerAd _bottomBannerAd;

  void createBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitID,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_) {
        print('loaded');
        setState(() {
          isBottomBannerLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        print(error);
        ad.dispose();
      }),
    );
    _bottomBannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    createBottomBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: homePagesList[controller.actualIndex],
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.favorite_border_outlined), label: 'Favorites'),
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
        //     BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Donate'),
        //   ],
        //   currentIndex: controller.actualIndex,
        //   onTap: (int index) {
        //     setState(() {
        //       controller.onTabTapped(index);
        //     });
        //   },
        // ),
        bottomNavigationBar: Visibility(
            visible: isBottomBannerLoaded,
            child: Container(
              height: _bottomBannerAd.size.height.toDouble(),
              width: _bottomBannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bottomBannerAd),
            )),
      ),
    );
  }
}
