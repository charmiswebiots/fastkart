import '../../../../config.dart';

class AmountItemButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  const AmountItemButton({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          height: AppScreenUtil().screenHeight( AppScreenUtil().screenActualWidth() > 377 ? 53: 57),
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15),
              vertical: AppScreenUtil().screenHeight(10)),
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(20),
              vertical: AppScreenUtil().screenHeight(10)),
          decoration: BoxDecoration(
              color: appCtrl.appTheme.primary,
              borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShopFontStyle().mulishtextLayout(
                      text: '2 Items',
                      color: appCtrl.appTheme.white,
                      fontSize: ShopFontSize.textSizeSmall),
                  Space(0, 5),
                  ShopFontStyle().mulishtextLayout(
                      text: ShopFont().dollar + "250.00",
                      color: appCtrl.appTheme.white,
                      fontSize: ShopFontSize.textSizeSMedium),
                ],
              ),
              InkWell(
                onTap:onTap,
                child: Row(
                  children: [
                    ShopFontStyle().mulishtextLayout(
                        text: ShopFont().viewCart,
                        color: appCtrl.appTheme.white,
                        fontSize: ShopFontSize.textSizeSMedium),
                    Space(5, 0),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: appCtrl.appTheme.white,
                      size: AppScreenUtil().size(18),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
