
import '../../../config.dart';

class OrderTrack extends StatelessWidget {
  var orderTrackCtrl = Get.put(OrderTrackController());

  OrderTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderTrackController>(builder: (_) {
          return Scaffold(
            appBar: OrderTrackWidget().appBarLayout(
              bgColor: orderTrackCtrl.appCtrl.appTheme.whiteColor,titleColor: orderTrackCtrl.appCtrl.appTheme.titleColor,image: orderTrackCtrl.appCtrl.isTheme
                ? imageAssets.themeLogo
                : imageAssets.logo,
              onTap: ()=> orderTrackCtrl.goToHome()
            ),
            backgroundColor: orderTrackCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: Container(
                color: orderTrackCtrl.appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,

                  children: [
                    Stack(
                      children: [
                        //success image layout
                        SingleChildScrollView(
                            child: OrderTrackStyle()
                                .backgroundLayout(context: context)),
                        //order track detail
                        OrderTrackDetail()
                      ],
                    ),
                    //button layout
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(15),vertical: AppScreenUtil().screenHeight(10)),
                      child: CustomButton(
                        height: 45,
                        title: OrderTrackFont().orderDetail,
                        color: orderTrackCtrl.appCtrl.appTheme.primary,
                        fontColor: orderTrackCtrl.appCtrl.appTheme.whiteColor,
                        onTap: () => Get.toNamed(routeName.orderDetail),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
