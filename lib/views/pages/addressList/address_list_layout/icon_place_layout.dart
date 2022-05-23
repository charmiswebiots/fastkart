import '../../../../config.dart';

class IconAndPlaceLayout extends StatelessWidget {
  final int? index;
  final String? text;
  const IconAndPlaceLayout({Key? key,this.index,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            Image.asset(
              iconAssets.work,
              color: appCtrl.appTheme.titleColor,
              height: AppScreenUtil().screenHeight(20),
            ),
            const Space(8, 0),
            AddressListFontStyle().mulishtextLayout(
                text: text,
                fontSize: AddressListFontSize.textSizeSMedium,
                color: appCtrl.appTheme.titleColor,
                fontWeight: FontWeight.w700),
            const  Space(8, 0),
            if (index == 0)
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: AppScreenUtil().screenHeight(2),
                    horizontal: AppScreenUtil().screenWidth(15)),
                decoration: BoxDecoration(
                    color: appCtrl.appTheme.primary,
                    borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(50))),
                child: AddressListFontStyle().mulishtextLayout(
                    text: AddressListFont().defaultTitle,
                    fontSize: AddressListFontSize.textXSizeSmall,
                    color: appCtrl.appTheme.white,
                    fontWeight: FontWeight.normal),
              )
          ],
        );
      }
    );
  }
}
