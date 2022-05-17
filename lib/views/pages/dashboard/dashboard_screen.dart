import 'dart:async';
import 'package:fastkart/controllers/dashboard_controller.dart';
import 'package:fastkart/widgets/common_appbar_widget/common_appbar.dart';
import '../../../config.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Timer? timer;
  final dashboardCtrl = Get.put(DashboardController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => GetBuilder<DashboardController>(builder: (_) {
        return WillPopScope(
          onWillPop: () {
            return Future(() => false);
          },
          child: Scaffold(
            key: dashboardCtrl.scaffoldKey,
            drawer:  DrawerScreen(),
            appBar:  PreferredSize(
              preferredSize: Size.fromHeight(AppScreenUtil().screenHeight(300)),
              child: Offstage(
                offstage:
                    dashboardCtrl.appCtrl.selectedIndex == 4 ? true : false,
                child: CommonAppBar1(
                  onTap: () => dashboardCtrl.appBarLeadingFunction(),
                  actionTap: () => dashboardCtrl.actionTap(),
                  isTheme: dashboardCtrl.appCtrl.isTheme,
                  borderColor: dashboardCtrl.appCtrl.appTheme.titleColor,
                  color: dashboardCtrl.appCtrl.appTheme.titleColor,
                  isWishListText:
                      dashboardCtrl.appCtrl.selectedIndex == 4 ? true : false,
                  isCart:
                      dashboardCtrl.appCtrl.selectedIndex == 1 ? true : false,
                  isLocation: (dashboardCtrl.appCtrl.selectedIndex == 0 ||
                          dashboardCtrl.appCtrl.selectedIndex == 2)
                      ? true
                      : false,
                  isBack: (dashboardCtrl.appCtrl.selectedIndex == 1 ||
                          dashboardCtrl.appCtrl.selectedIndex == 3 ||
                          dashboardCtrl.appCtrl.selectedIndex == 4)
                      ? true
                      : false,
                  isCategory: (dashboardCtrl.appCtrl.selectedIndex == 0 ||
                          dashboardCtrl.appCtrl.selectedIndex == 2)
                      ? true
                      : false,
                  isHome: (dashboardCtrl.appCtrl.selectedIndex == 3 ||
                          dashboardCtrl.appCtrl.selectedIndex == 4)
                      ? true
                      : false,
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigatorCard(
              selectedIndex: dashboardCtrl.appCtrl.selectedIndex,
              onTap: (val) => dashboardCtrl.bottomNavigationChange(val),
            ),
            body: dashboardCtrl.appCtrl.widgetOptions
                .elementAt(dashboardCtrl.appCtrl.selectedIndex),
          ),
        );
      }),
    );
  }
}
