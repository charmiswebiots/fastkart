import '../../../../config.dart';

class BannerContent extends StatelessWidget {
  final int? itemIndex;
  const BannerContent({Key? key,this.itemIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Positioned(
          top: MediaQuery.of(context).size.height / 15,
          child: Padding(
            padding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(20),right: AppScreenUtil().screenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeFontStyle().quicksandtextLayout(
                    text: AppArray().bannerList[itemIndex!].title,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: itemIndex!.isEven
                        ? appCtrl.appTheme.bannerTitleColor
                        : appCtrl.appTheme.white),
                const Space(0, 5),
                HomeFontStyle().quicksandtextLayout(
                    text: AppArray()
                        .bannerList[itemIndex!]
                        .description,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: itemIndex!.isEven
                        ? appCtrl.appTheme.darkContentColor
                        : appCtrl.appTheme.white),
                const Space(0, 15),
                InkWell(
                  onTap: () => Get.toNamed(routeName.shopScreen),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppScreenUtil().borderRadius(5)),
                        color: itemIndex!.isEven
                            ? appCtrl.appTheme.primary
                            : appCtrl.appTheme.white),
                    padding: EdgeInsets.symmetric(
                        vertical: AppScreenUtil().screenHeight(5),
                        horizontal:
                        AppScreenUtil().screenHeight(20)),
                    child: HomeFontStyle().mulishtextLayout(
                        text: AppArray()
                            .bannerList[itemIndex!]
                            .buttonTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: itemIndex!.isEven
                            ? appCtrl.appTheme.white
                            : appCtrl.appTheme.primary),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
