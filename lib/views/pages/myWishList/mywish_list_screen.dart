import '../../../config.dart';

class MyWishListScreen extends StatelessWidget {
  final wishListCtrl = Get.put(MyWishListController());

  MyWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => AppComponent(
        child: GetBuilder<MyWishListController>(builder: (_) {
          return  Directionality(
            textDirection:
            wishListCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              appBar: MyWishListWidget().appbarLayout(
                  bgColor: wishListCtrl.appCtrl.appTheme.whiteColor,
                  titleColor: wishListCtrl.appCtrl.appTheme.titleColor,
                  text: MyWishListFont().myWishList,
                  onTap: () => Get.toNamed(routeName.myCart, arguments: true)),
              backgroundColor: wishListCtrl.appCtrl.appTheme.whiteColor,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: wishListCtrl.isLoading
                    ? Shimmer.fromColors(
                        baseColor: wishListCtrl.appCtrl.appTheme.darkGray
                            .withOpacity(.3),
                        highlightColor: wishListCtrl.appCtrl.appTheme.darkGray
                            .withOpacity(.1),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(15)),
                          child: const OfferShimmer(),
                        ))
                    : Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: AppScreenUtil().screenHeight(50)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  // wish list layout
                                  MyWishListLayout(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
