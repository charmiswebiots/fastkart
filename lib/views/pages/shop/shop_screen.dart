import '../../../config.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  var shopCtrl = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<ShopController>(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: shopCtrl.appCtrl.appTheme.whiteColor,
              leadingWidth: AppScreenUtil().screenWidth(100),
              leading: CommonAppBarLeading(
                onTap: () => Get.back(),
                isImage: true,
              ),
              title: ShopStyle().appBarTitleLayout(
                  text: "Fresh Fruits& Vegetables",
                  textColor: shopCtrl.appCtrl.appTheme.darkContentColor),
              actions: [
                ShopWidget()
                    .appBarActionLayout(onTap: shopCtrl.actionButtonTap),
              ],
            ),
            backgroundColor: shopCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: Container(
                color: shopCtrl.appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    //main Layout
                    const MainLayout(),
                    //amount and item button layout
                    AmountItemButton(
                      onTap: () =>
                          Get.toNamed(routeName.myCart, arguments: true),
                    )
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
