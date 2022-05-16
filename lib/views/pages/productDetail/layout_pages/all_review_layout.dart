
import '../../../../config.dart';

class AllReviewLayout extends StatelessWidget {
  final dynamic reviewList;
  const AllReviewLayout({Key? key,this.reviewList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15),
              vertical: AppScreenUtil().screenHeight(15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
          ),
          height: MediaQuery.of(context).size.height /
              AppScreenUtil().screenHeight(1.5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailFontStyle().mulishtextLayout(
                    text: ProductDetailFont().allReview,
                    fontWeight: FontWeight.w600,
                    fontSize: ProductDetailFontSize.textSizeSMedium,
                    color: appCtrl.appTheme.titleColor),
                const  Space(0, 10),
                ListView.builder(
                  itemCount: reviewList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ReviewCard(
                      data: reviewList[index],

                      glowColor: appCtrl.appTheme.primary,
                      unratedColor: appCtrl.appTheme.contentColor,
                      ratingColor: appCtrl.appTheme.ratingColor,
                      color: appCtrl.appTheme.wishtListBoxColor,
                      descColor: appCtrl.appTheme.darkContentColor,
                      nameColor: appCtrl.appTheme.titleColor,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
