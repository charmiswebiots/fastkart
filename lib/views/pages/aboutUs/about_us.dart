import '../../../config.dart';

class AboutUs extends StatelessWidget {
  final aboutUsCtrl = Get.put(AboutUsController());

  AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<AboutUsController>(builder: (_) {
          return Directionality(
            textDirection: aboutUsCtrl.appCtrl.isRTL
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Scaffold(
              //app bar layout
              appBar: AboutUsWidget().appBarLayout(
                  bgColor: aboutUsCtrl.appCtrl.appTheme.whiteColor,
                  titleColor: aboutUsCtrl.appCtrl.appTheme.titleColor,
                  image: aboutUsCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo,
                  onTap: () => aboutUsCtrl.goToHome()),
              backgroundColor: aboutUsCtrl.appCtrl.appTheme.whiteColor,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
                  child: Container(
                    color: aboutUsCtrl.appCtrl.appTheme.whiteColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(15)),
                      child: const AboutUsDataLayout(),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
