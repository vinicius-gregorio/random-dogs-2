import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

initializeAppConfig() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
}
