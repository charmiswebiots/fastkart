import '../../../config.dart';

class OrderHistoryScreen extends StatelessWidget {
  final orderHistoryCtrl = Get.put(OrderHistoryController());

  OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderHistoryController>(builder: (_) {
          return Scaffold(
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

                            //search product textformfield layout
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppScreenUtil().screenHeight(orderHistoryCtrl.appCtrl.languageVal == "ar" ? 15 :0),
                                  right: AppScreenUtil().screenHeight(orderHistoryCtrl.appCtrl.languageVal != "ar" ? 15 :0)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CommonSearchTextForm(
                                      text: OrderHistoryFont().searchProduct,
                                      borderColor: orderHistoryCtrl
                                          .appCtrl.appTheme.primary
                                          .withOpacity(.3),
                                      hintColor: orderHistoryCtrl
                                          .appCtrl.appTheme.contentColor,
                                      fillcolor: orderHistoryCtrl
                                          .appCtrl.appTheme.textBoxColor,
                                      titleColor: orderHistoryCtrl
                                          .appCtrl.appTheme.titleColor,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => orderHistoryCtrl.bottomSheet(
                                        context: context),
                                    child: OrderHistoryFontStyle()
                                        .mulishtextLayout(
                                            text: OrderHistoryFont().filter,
                                            fontSize: 16,
                                            color: orderHistoryCtrl
                                                .appCtrl.appTheme.primary,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),

                            //order list layout
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppScreenUtil().screenHeight(15),
                                  horizontal: AppScreenUtil().screenWidth(15)),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: orderHistoryCtrl.orderHistory.length,
                                itemBuilder: (context, index) {
                                  return OrderHistoryCard(
                                    data: orderHistoryCtrl.orderHistory[index],
                                    index: index,
                                  );
                                },
                              ),
                            )
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
