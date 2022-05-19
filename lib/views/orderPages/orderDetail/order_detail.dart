import '../../../config.dart';

class OrderDetail extends StatelessWidget {
  final orderDetailCtrl = Get.put(OrderDetailController());

  OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderDetailController>(builder: (_) {
          return Scaffold(
            appBar: OrderDetailWidget().appBarLayout(
                backgroundColor: orderDetailCtrl.appCtrl.appTheme.whiteColor,
                titleColor: orderDetailCtrl.appCtrl.appTheme.titleColor,
                image: orderDetailCtrl.appCtrl.isTheme
                    ? imageAssets.themeFkLogo
                    : imageAssets.fkLogo,
                onTap: () => orderDetailCtrl.goToHome()),
            backgroundColor: orderDetailCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: orderDetailCtrl.isLoading
                  ? const OrderSummaryShimmer()
                  : Container(
                      color: orderDetailCtrl.appCtrl.appTheme.whiteColor,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          //body layout
                          const DataLayout(),
                          //button layout
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(15),
                                vertical: AppScreenUtil().screenHeight(10)),
                            child: CustomButton(
                              height: 40,
                              title: OrderDetailFont().reorder,
                              color: orderDetailCtrl.appCtrl.appTheme.primary,
                              fontColor:
                                  orderDetailCtrl.appCtrl.appTheme.whiteColor,
                              onTap: () => orderDetailCtrl.reorder(),
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
