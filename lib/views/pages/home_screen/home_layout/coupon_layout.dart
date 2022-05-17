import '../../../../config.dart';

class CouponLayout extends StatelessWidget {
  const CouponLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController  >(builder: (homeCtrl) {
      return Container(
        height: MediaQuery.of(context).size.height * 30 / 100,
        width: MediaQuery.of(context).size.width,
        color: homeCtrl.appCtrl.appTheme.couponBoxColor,
        padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          right: AppScreenUtil().screenWidth(15),
          top: AppScreenUtil().screenHeight(20),
        ),
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //everyday essential and see all  widget
            HomeStyle().commonTitleAndSeeAllWidget(
                title: HomeFont().coupensForYou,
                seeAllText: HomeFont().seeAll,
                seeAllColor: homeCtrl.appCtrl.appTheme.primary),
            const Space(0, 5),
            //popular offers of the day text widget
            HomeWidget().commonDescriptionTextWidget(
                text: HomeFont().payLessGetMore,
                color: homeCtrl.appCtrl.appTheme.darkContentColor),
            SizedBox(
              height: MediaQuery.of(context).size.height * 20 / 100,
              child: ListView.builder(
                itemCount: AppArray().couponData.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CouponCard(
                      index: index,
                      isTheme: homeCtrl.appCtrl.isTheme,
                      titleColor: homeCtrl.appCtrl.appTheme.bannerTitleColor,
                      couponModel: AppArray().couponData[index],
                      primaryColor: homeCtrl.appCtrl.appTheme.primary,
                      decriptionColor: homeCtrl.appCtrl.appTheme.darkContentColor);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
