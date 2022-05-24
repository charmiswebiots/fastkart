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
    wishListCtrl.isAppBar = Get.arguments ?? false;
    wishListCtrl.update();
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
                  child: Directionality(
                      textDirection: wishListCtrl.appCtrl.isRTL
                          ? TextDirection.rtl
                          : TextDirection.ltr,
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
                        backgroundColor:
                            wishListCtrl.appCtrl.appTheme.blackColor,
                        body: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowIndicator();
                            return false;
                          },
                          child: wishListCtrl.isLoading
                              ? MyCartShimmer(
                                  isAppBar: wishListCtrl.isAppBar,
                                )
                              : const BodyComponent(),
                        ),
                      )));
            }));
  }
}
