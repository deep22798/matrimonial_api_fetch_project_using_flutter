

import 'package:get/get.dart';
import 'package:rs_matrimonial/view/homescreen.dart';
import 'package:rs_matrimonial/view/splash.dart';
/// Routes name to directly navigate the route by its name
class Routes {
  static String splash = '/splash';
  static String home = '/home';
  static String search = '/search';
}

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
final getPages = [
  GetPage(
    name: Routes.splash,
    page: () =>  Splash(),
  ),
  GetPage(
    name: Routes.home,
    page: () =>  HomeScreen(),
  ),
  // GetPage(
  //   name: Routes.search,
  //   page: () =>  search(),
  // ),
];