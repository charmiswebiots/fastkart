
import 'package:fastkart/views/pages/onboarding_screen/onboarding_screen.dart';
import 'package:get/get.dart';

//app file
import 'route_name.dart';
import 'screen_list.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.changeTheme, page: () => ChangeTheme()),
    GetPage(name: _routeName.home, page: () => Index()),
    GetPage(name: _routeName.onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: _routeName.login, page: () => LoginScreen()),
  ];
}
