import '../../../config.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return false;
          },
          child: GetBuilder<AppController>(
            builder: (_) => GetBuilder<HomeController>(builder: (_) {
              return Container(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        //search textformfield layout
                        CommonSearchTextForm(
                          text: CategoryFont().searchProduct,
                          borderColor:
                              homeCtrl.appCtrl.appTheme.primary.withOpacity(.3),
                          hintColor: homeCtrl.appCtrl.appTheme.contentColor,
                          fillcolor: homeCtrl.appCtrl.appTheme.textBoxColor,
                          titleColor: homeCtrl.appCtrl.appTheme.titleColor,
                        ),
                        Space(0, 20),
                        //Banner
                        BannerList(),
                        Space(0, 20),
                        //recent bought widget
                        RecentBoughtList(
                          list: AppArray().recentBoughtList,
                        ),
                        Space(0, 10),
                        //recent bought widget
                        ShopByCategoryText(),
                        Space(0, 10),
                        //shop by category list
                        ShopByCategory(),
                        Space(0, 20),
                        //offer list widget
                        OfferListAndContent(),
                        Space(0, 20),
                        //lowest price and everyday essential layout
                        HomeStyle().lowestPriceAndEveryDayEssentialWidget(
                            containerColor:
                                homeCtrl.appCtrl.appTheme.whiteColor,
                            context: context,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //lowest price layout
                                CommonHorizontalList(
                                  text: HomeFont().lowestPrice,
                                  title: HomeFont().payLessGetMore,
                                  data: AppArray().lowerPriceList,
                                ),

                                Space(0, 20),
                                //Everyday Essentials layout
                                CommonHorizontalList(
                                  text: HomeFont().everydayEssentials,
                                  title: HomeFont().payLessGetMore,
                                  data: AppArray().everyDayEssentialList,
                                ),
                              ],
                            )),
                        //coupons layout
                        CouponLayout(),
                        Space(0, 20),
                        //lowest price and browse category layout
                        LowestPriceAndButton(),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
