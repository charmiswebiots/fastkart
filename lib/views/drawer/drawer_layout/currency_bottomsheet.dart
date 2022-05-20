import '../../../config.dart';

class CurrencyBottomSheet extends StatelessWidget {
  const CurrencyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return DrawerWidget().popLayout(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerFontStyle().mulishtextLayout(
                  text: DrawerFont().selectLanguage,
                  fontSize: DrawerFontSize.textSizeSMedium,
                  color: appCtrl.appTheme.titleColor),
              const Space(0, 20),
              ...AppArray().currencyList.map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(10)),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                      appCtrl.priceConvertor(e['code'],e['symbol']);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          e['icon'].toString(),
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        const Space(10, 0),
                        DrawerFontStyle().mulishtextLayout(
                            text: e['title'].toString(),
                            fontSize: DrawerFontSize.textSizeSMedium,
                            color: appCtrl.appTheme.titleColor),
                      ],
                    ),
                  ),
                );
              }).toList()
            ],
          ));
    });
  }
}
