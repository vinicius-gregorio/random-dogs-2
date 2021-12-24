import 'dart:io';

class AdHelper {
  static String get bannerAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2724987331324516/7654896687';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-2724987331324516/8702246863';
    } else {
      throw UnsupportedError('Admob not supported for this platform');
    }
  }
}
