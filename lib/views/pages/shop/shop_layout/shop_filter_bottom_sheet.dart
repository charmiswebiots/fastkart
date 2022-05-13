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
        return Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(15)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                  topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
            ),
            height: MediaQuery.of(context).size.height / 1.5,
            child: SingleChildScrollView(
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
                  Space(0, 20),
                  child!,
                  Space(0, 20),
                  ShopFontStyle().mulishtextLayout(
                      text: ShopFont().packSize,
                      fontSize: ShopFontSize.textSizeSMedium,
                      fontWeight: FontWeight.w600,
                      color: shopCtrl.appCtrl.appTheme.titleColor),
                  Space(0, 20),
                  packageSize!,
                  Space(0, 20),
                  ShopFontStyle().mulishtextLayout(
                      text: ShopFont().priceRange,
                      fontSize: ShopFontSize.textSizeSMedium,
                      fontWeight: FontWeight.w600,
                      color: shopCtrl.appCtrl.appTheme.titleColor),
                  Space(0, 20),
                  rangeSlider!,
                  Space(0, 20),
                  buttonLayout!
                ],
              ),
            ));
      }
    );
  }
}
