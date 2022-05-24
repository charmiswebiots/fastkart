import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/shop/shop_layout/shop_list_layout.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<ShopController>(builder: (shopCtrl) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //category layout
              const ShopCategory(),

              //search product textformfield layout
              Padding(
                padding: EdgeInsets.only(
                    left: AppScreenUtil().screenHeight(
                        shopCtrl.appCtrl.languageVal == "ar" ||
                                shopCtrl.appCtrl.isRTL
                            ? 15
                            : 0),
                    right: AppScreenUtil().screenHeight(
                        shopCtrl.appCtrl.languageVal != "ar" ||
                                shopCtrl.appCtrl.isRTL
                            ? 15
                            : 0)),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonSearchTextForm(
                        text: CategoryFont().searchProduct,
                        borderColor:
                            shopCtrl.appCtrl.appTheme.primary.withOpacity(.3),
                        hintColor: shopCtrl.appCtrl.appTheme.contentColor,
                        fillcolor: shopCtrl.appCtrl.appTheme.textBoxColor,
                        titleColor: shopCtrl.appCtrl.appTheme.titleColor,
                      ),
                    ),
                    InkWell(
                      onTap: () => shopCtrl.bottomSheet(),
                      child: ShopFontStyle().mulishtextLayout(
                          text: ShopFont().filter,
                          fontSize: 16,
                          color: shopCtrl.appCtrl.appTheme.primary,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),

              //shop list
              const ShopListLayout(),
              const Space(0, 60),
            ],
          ),
        );
      });
    });
  }
}
