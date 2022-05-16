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
    return GetBuilder<AppController>(
      builder: (_) {
        return Scaffold(
          drawer: DrawerScreen(),
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: appCtrl.appTheme.whiteColor,
            titleSpacing: 0,
            centerTitle: false,
            leading: Error404Widget().appBarLeadingLayout(
                onTap: () => _scaffoldKey.currentState!.openDrawer(),
                borderColor: appCtrl.appTheme.titleColor,
                iconColor: appCtrl.appTheme.titleColor,
                image:
                    appCtrl.isTheme ? imageAssets.themeFkLogo : imageAssets.fkLogo),
            title: Error404Widget().appBarTitleLayout(
                image: appCtrl.isTheme ? imageAssets.themeLogo : imageAssets.logo,
                textColor: appCtrl.appTheme.titleColor),
            actions: [
              Error404Widget()
                  .appBarActionLayout(iconColor: appCtrl.appTheme.titleColor),
            ],
          ),
          bottomNavigationBar: BottomNavigatorCard(
            selectedIndex: appCtrl.selectedIndex,
            onTap: (val)=> appCtrl.errorBottomNavigationClick(val),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: Platform.isIOS
                        ? MediaQuery.of(context).size.height /
                            AppScreenUtil().screenHeight(15)
                        : MediaQuery.of(context).size.height /
                            AppScreenUtil().screenHeight(20),
                    left: AppScreenUtil().screenHeight(15),
                    right: AppScreenUtil().screenHeight(15)),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Error404Widget().commonIconImage(
                            image: imageAssets.noPageFoundImage, height: 100),
                        const Space(0, 15),
                        Error404FontStyle().quicksandtextLayout(
                            text: Error404Font().pageNotFound,
                            fontSize: Error404FontSize.textSizeNormal,
                            color: appCtrl.appTheme.titleColor,
                            fontWeight: FontWeight.w600),
                        const Space(0, 15),
                        Error404FontStyle().quicksandtextLayout(
                            text: Error404Font().description,
                            fontSize: Error404FontSize.textSizeSMedium,
                            color: appCtrl.appTheme.darkContentColor,
                            fontWeight: FontWeight.normal),
                        const Space(0, 15),
                        Error404Widget().backToHomeWidget(
                            text: Error404Font().backToHome,
                            color: appCtrl.appTheme.primary,
                            fontColor: appCtrl.appTheme.whiteColor,
                            context: context)
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        );
      }
    );
  }
}
