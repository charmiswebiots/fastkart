import '../../../../config.dart';

class ShopFilterSheet extends StatelessWidget {
  final Widget? child;
  final Widget? packageSize;
  final Widget? rangeSlider;
  final Widget? buttonLayout;
  const ShopFilterSheet({Key? key,this.child,this.rangeSlider,this.buttonLayout,this.packageSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (shopCtrl) {
        return Directionality(
          textDirection:
          shopCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(15),
                  vertical: AppScreenUtil().screenHeight(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                    topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
              ),
              height: MediaQuery.of(context).size.height / 1.5,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShopFontStyle().mulishtextLayout(
                                text: ShopFont().category,
                                fontSize: ShopFontSize.textSizeSMedium,
                                fontWeight: FontWeight.w600,
                                color: shopCtrl.appCtrl.appTheme.titleColor),
                            ShopFontStyle().mulishtextLayout(
                                text: ShopFont().reset,
                                fontSize: ShopFontSize.textSizeSMedium,
                                fontWeight: FontWeight.w600,
                                color: shopCtrl.appCtrl.appTheme.primary),
                          ],
                        ),
                        const Space(0, 20),
                        child!,
                        const Space(0, 20),
                        ShopFontStyle().mulishtextLayout(
                            text: ShopFont().packSize,
                            fontSize: ShopFontSize.textSizeSMedium,
                            fontWeight: FontWeight.w600,
                            color: shopCtrl.appCtrl.appTheme.titleColor),
                        const Space(0, 20),
                        packageSize!,
                        const Space(0, 20),
                        ShopFontStyle().mulishtextLayout(
                            text: ShopFont().priceRange,
                            fontSize: ShopFontSize.textSizeSMedium,
                            fontWeight: FontWeight.w600,
                            color: shopCtrl.appCtrl.appTheme.titleColor),
                        const  Space(0, 20),
                        rangeSlider!,
                        const Space(0, 50),

                      ],
                    ),
                  ),
                  buttonLayout!
                ],
              )),
        );
      }
    );
  }
}
