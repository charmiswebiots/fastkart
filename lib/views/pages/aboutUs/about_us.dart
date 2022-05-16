import '../../../config.dart';

class AboutUs extends StatelessWidget {
  final aboutUsCtrl = Get.put(AboutUsController());

  AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<AboutUsController>(builder: (_) {
          return Scaffold(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //image layout
                        Image.asset(imageAssets.aboutUs),
                        const Space(0, 20),
                        //who we are text layout
                        AboutUsStyle().commonTitle(
                            text: AboutUsFont().whoWeAre,
                            color: aboutUsCtrl.appCtrl.appTheme.titleColor),

                        const Space(0, 5),

                        //who we are value layout
                        AboutUsStyle().whoWeAreText(
                            aboutUsCtrl.appCtrl.appTheme.darkContentColor),
                        const Space(0, 30),

                        //how do order text layout
                        AboutUsStyle().commonTitle(
                            text: AboutUsFont().howDoOrder,
                            color: aboutUsCtrl.appCtrl.appTheme.titleColor),
                        const Space(0, 20),

                        //how do order list layout
                        const HowDoOrderLayout(),

                        const Space(0, 30),
                        //People who Build Fastkart text layout
                        AboutUsStyle().commonTitle(
                            text: AboutUsFont().peopleWhoBuildFastkart,
                            color: aboutUsCtrl.appCtrl.appTheme.titleColor),
                        const Space(0, 20),

                        //team list
                        const TeamListLayout()
                      ],
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
