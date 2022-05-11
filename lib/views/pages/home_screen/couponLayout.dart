import 'package:fastkart/views/pages/home_screen/couponCard.dart';
import '../../../config.dart';

class CouponLayout extends StatelessWidget {
  const CouponLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        height: MediaQuery.of(context).size.height * 30 / 100,
        width: MediaQuery.of(context).size.width,
        color: appCtrl.appTheme.couponBoxColor,
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
                seeAllColor: appCtrl.appTheme.primary),
            Space(0, 5),
            //popular offers of the day text widget
            HomeWidget().commonDescriptionTextWidget(
                text: HomeFont().payLessGetMore,
                color: appCtrl.appTheme.darkContentColor),
            Container(
              height: MediaQuery.of(context).size.height * 20 / 100,
              child: ListView.builder(
                itemCount: AppArray().couponData.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CouponCard(
                      index: index,
                      isTheme: appCtrl.isTheme,
                      titleColor: appCtrl.appTheme.bannerTitleColor,
                      couponModel: AppArray().couponData[index],
                      primaryColor: appCtrl.appTheme.primary,
                      decriptionColor: appCtrl.appTheme.darkContentColor);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
