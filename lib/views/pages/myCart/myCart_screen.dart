import '../../../config.dart';

class MyCartListScreen extends StatefulWidget {
  const MyCartListScreen({Key? key}) : super(key: key);

  @override
  State<MyCartListScreen> createState() => _MyCartListScreenState();
}

class _MyCartListScreenState extends State<MyCartListScreen> {
  var wishListCtrl = Get.put(MyCartListController());

  void doNothing(BuildContext context) {}

  @override
  void initState() {
    // TODO: implement initState
    print(Get.arguments);
    wishListCtrl.isAppBar = Get.arguments ?? false;
    wishListCtrl.update();
    print(wishListCtrl.isAppBar);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => GetBuilder<MyCartListController>(builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (wishListCtrl.isAppBar == true) {
              Get.back();
            }
            return Future(() => wishListCtrl.isAppBar ? true : false);
          },
          child: AppComponent(
            child: Scaffold(
              appBar: wishListCtrl.isAppBar
                  ? MyCartWidget().appBarLayout(
                      actionOnTap: () => wishListCtrl.goToHome(),
                      onTap: () => wishListCtrl.leadingTap())
                  : MyCartStyle().appBarPreferred(
                      context: context,
                      child: MyCartWidget().appBarLayout(
                          actionOnTap: () => wishListCtrl.goToHome(),
                          onTap: () => wishListCtrl.leadingTap())),
              backgroundColor: wishListCtrl.appCtrl.appTheme.blackColor,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return false;
                },
                child: MyCartStyle().bodyComponentLayout(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: AppScreenUtil().screenHeight(50)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // wish list layout
                            CartListLayout(),
                            //offer ui card
                            OfferUICard(
                              onTap: () => wishListCtrl.bottomSheet(
                                context: context,
                                data: AppArray().myOfferList[0],
                              ),
                            ),
                            Space(0, 5),
                            //price detail layout
                            PriceDetailLayout()
                          ],
                        ),
                      ),
                    ),
                    proceesToCheckout: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                      child: CustomButton(
                        height: 45,
                        title: MyCartFont().proceedtoCheckout,
                        color: wishListCtrl.appCtrl.appTheme.primary,
                        fontColor: wishListCtrl.appCtrl.appTheme.whiteColor,
                        onTap: () => Get.toNamed(routeName.addAddress),
                      ),
                    )),
              ),
            ),
          ),
        );
      }),
    );
  }
}
