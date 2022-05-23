import '../../../config.dart';

class OrderHistoryScreen extends StatelessWidget {
  final orderHistoryCtrl = Get.put(OrderHistoryController());

  OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderHistoryController>(builder: (_) {
          return  Directionality(
            textDirection:
            orderHistoryCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              appBar: OrderHistoryWidget().appbarLayout(
                  backgroundColor: orderHistoryCtrl.appCtrl.appTheme.whiteColor,
                  titleColor: orderHistoryCtrl.appCtrl.appTheme.titleColor,
                  image: orderHistoryCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo,
                  onTap: () => orderHistoryCtrl.goToHome()),
              backgroundColor: orderHistoryCtrl.appCtrl.appTheme.whiteColor,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: orderHistoryCtrl.isLoading
                    ? const OrderHistoryShimmer()
                    : SingleChildScrollView(
                        child: Container(
                          color: orderHistoryCtrl.appCtrl.appTheme.whiteColor,
                          child: Column(
                            children: [
                              //category layout
                              const OrderHistoryDaysList(),
                              const Space(0, 15),
                              //search product textformfield layout
                              TextFormFilterLayout(
                                onTap: () => orderHistoryCtrl.bottomSheet(
                                    context: context),
                              ),

                              //order list layout
                              const OrderListLayout()
                            ],
                          ),
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
