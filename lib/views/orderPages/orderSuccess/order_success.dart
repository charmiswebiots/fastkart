import '../../../config.dart';

class OrderSuccess extends StatelessWidget {
  final orderSuccessCtrl = Get.put(OrderSuccessController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderSuccessController>(builder: (_) {
          return Directionality(
            textDirection: orderSuccessCtrl.appCtrl.isRTL
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Scaffold(
              key: _scaffoldKey,
              drawer: DrawerScreen(),
              appBar: OrderSuccesWidget().appBarLayout(
                  isRTL: orderSuccessCtrl.appCtrl.isRTL,
                  bgColor: orderSuccessCtrl.appCtrl.appTheme.whiteColor,
                  onTap: () => _scaffoldKey.currentState!.openDrawer(),
                  titleColor: orderSuccessCtrl.appCtrl.appTheme.titleColor,
                  image: orderSuccessCtrl.appCtrl.isTheme
                      ? imageAssets.themeLogo
                      : imageAssets.logo,
                  actionTap: () => orderSuccessCtrl.goToHome()),
              backgroundColor: orderSuccessCtrl.appCtrl.appTheme.whiteColor,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: Container(
                  color: orderSuccessCtrl.appCtrl.appTheme.whiteColor,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //order success detail
                      const OrderSuccessDetail(),

                      //track package button layout
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(15),
                            vertical: AppScreenUtil().screenHeight(10)),
                        child: CustomButton(
                          height: 40,
                          title: OrderSuccessFont().orderTrack,
                          color: orderSuccessCtrl.appCtrl.appTheme.primary,
                          fontColor:
                              orderSuccessCtrl.appCtrl.appTheme.whiteColor,
                          onTap: () => Get.toNamed(routeName.orderTrack),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
