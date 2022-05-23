import 'dart:io';
import 'package:fastkart/config.dart';


class Error404Page extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Error404Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (_) {
      return Directionality(
        textDirection:
        appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: DrawerScreen(),
          drawerEnableOpenDragGesture: true,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: appCtrl.appTheme.whiteColor,
            titleSpacing: 0,
            centerTitle: false,
            leading: Error404Widget().appBarLeadingLayout(
                onTap: () => _scaffoldKey.currentState!.openDrawer(),
                isRTL: appCtrl.isRTL,
                language: appCtrl.languageVal,
                borderColor: appCtrl.appTheme.titleColor,
                iconColor: appCtrl.appTheme.titleColor,
                image: appCtrl.isTheme
                    ? imageAssets.themeFkLogo
                    : imageAssets.fkLogo),
            title: Error404Widget().appBarTitleLayout(
                image: appCtrl.isTheme ? imageAssets.themeLogo : imageAssets.logo,
                textColor: appCtrl.appTheme.titleColor),
            actions: const [
              AppbarUserIconLocation(),
            ],
          ),
          bottomNavigationBar: BottomNavigatorCard(
            selectedIndex: appCtrl.selectedIndex,
            onTap: (val) => appCtrl.errorBottomNavigationClick(val),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    top: Platform.isIOS
                        ? MediaQuery.of(context).size.height /
                            AppScreenUtil().screenHeight(15)
                        : MediaQuery.of(context).size.height /
                            AppScreenUtil().screenHeight(20),
                    left: AppScreenUtil().screenHeight(15),
                    right: AppScreenUtil().screenHeight(15)),
                child: Column(
                  children: const [
                   ErrorDataLayout(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
