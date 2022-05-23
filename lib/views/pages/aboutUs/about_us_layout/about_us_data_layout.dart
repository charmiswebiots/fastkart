import '../../../../config.dart';

class AboutUsDataLayout extends StatelessWidget {
  const AboutUsDataLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
      builder: (aboutUsCtrl) {
        return Column(
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
        );
      }
    );
  }
}
