import 'package:fastkart/views/pages/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

//app file
import 'route_name.dart';
import 'screen_list.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.changeTheme, page: () => ChangeTheme()),
    GetPage(name: _routeName.dashboard, page: () => const Dashboard()),
    GetPage(name: _routeName.onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: _routeName.login, page: () => LoginScreen()),
    GetPage(name: _routeName.signup, page: () => SignUpScreen()),
    GetPage(name: _routeName.error404page, page: () => Error404Page()),
  ];
}
