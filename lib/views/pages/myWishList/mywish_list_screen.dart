import '../../../config.dart';

class MyWishListScreen extends StatelessWidget {
  final wishListCtrl = Get.put(MyWishListController());

  MyWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => AppComponent(
        child: GetBuilder<MyWishListController>(builder: (_) {
          return Scaffold(
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
              child: Stack(
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
          );
        }),
      ),
    );
  }
}
