import 'package:fastkart/config.dart';

class ShopCategory extends StatelessWidget {
  const ShopCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<ShopController>(builder: (shopCtrl) {
        return Container(
          width: MediaQuery.of(context).size.width,
          color: appCtrl.appTheme.textBoxColor,
          margin: EdgeInsets.only(
            bottom: AppScreenUtil().screenHeight(15),
          ),
          padding: EdgeInsets.only(
            top: AppScreenUtil().screenHeight(8),
            bottom: AppScreenUtil().screenHeight(8),
          ),
          height: AppScreenUtil().screenHeight(38),
          child: ListView.builder(
            itemCount: shopCtrl.shopCategoryList.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: AppScreenUtil().screenWidth(12),
                    left: AppScreenUtil().screenWidth(
                        appCtrl.languageVal == "ar" || appCtrl.isRTL
                            ? 15
                            : index == 0
                                ? 15
                                : 0)),
                child: InkWell(
                  onTap: () => shopCtrl.selectCategory(
                      index, shopCtrl.shopCategoryList[index]['id']),
                  child: ShopFontStyle().mulishtextLayout(
                      text: shopCtrl.shopCategoryList[index]['title'],
                      fontSize: ShopFontSize.textSizeSMedium,
                      fontWeight: FontWeight.normal,
                      color: shopCtrl.selectIndex == index
                          ? shopCtrl.appCtrl.appTheme.primary
                          : shopCtrl.appCtrl.appTheme.titleColor),
                ),
              );
            },
          ),
        );
      });
    });
  }
}
