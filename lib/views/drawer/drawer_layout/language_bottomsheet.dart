import '../../../config.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

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
              ...AppArray().languageList.map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(10)),
                  child: InkWell(
                    onTap: () => appCtrl.languageSelection(e),
                    child: Row(
                      children: [
                        Image.asset(
                          e['icon'].toString(),
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        const Space(10, 0),
                        DrawerFontStyle().mulishtextLayout(
                            text: e['name'].toString(),
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
