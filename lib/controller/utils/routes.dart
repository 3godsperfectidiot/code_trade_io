import 'package:flutter/cupertino.dart';

import '../../view/screens/home_screen.dart';
import '../../view/screens/splash_screen.dart';

class Routes {
  static String splashScreen = "/";
  static String homeScreen = "/home_screen";

  Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => const SplashScreen(),
    homeScreen: (context) => const HomeScreen(),
  };
}
