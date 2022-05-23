import 'package:fastkart/config.dart';

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
                    left: AppScreenUtil().screenHeight(shopCtrl.appCtrl.languageVal == "ar"  || shopCtrl.appCtrl.isRTL? 15 :0),
                    right: AppScreenUtil().screenHeight(shopCtrl.appCtrl.languageVal != "ar" || shopCtrl.appCtrl.isRTL ? 15 :0)),
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
                      onTap: () => shopCtrl.bottomSheet(context: context),
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
              ShopWidget().shopLayout(
                  context: context,
                  child: ListView.builder(
                    itemCount: shopCtrl.offerList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return ShopListCard(
                        onTap: () => Get.toNamed(routeName.productDetail),
                        index: index,
                        data: shopCtrl.offerList[index],
                        discountTextColor: shopCtrl.appCtrl.appTheme.whiteColor,
                        dividerColor: shopCtrl.appCtrl.appTheme.contentColor
                            .withOpacity(.5),
                        quantityBorderColor:
                            shopCtrl.appCtrl.appTheme.lightPrimary,
                        titleColor: shopCtrl.appCtrl.appTheme.titleColor,
                        plusTap: () => shopCtrl.plusTap(index),
                        minusTap: () => shopCtrl.minusTap(index),
                      );
                    },
                  )),
              const Space(0, 60),
            ],
          ),
        );
      });
    });
  }
}
