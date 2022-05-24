import '../../../../config.dart';

class BgLayout extends StatelessWidget {
  const BgLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GetBuilder<HomeController>(builder: (homeCtrl) {
          return HomeStyle().lowestPriceAndEveryDayEssentialWidget(
              containerColor: homeCtrl.appCtrl.appTheme.whiteColor,
              context: context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //lowest price layout
                  CommonHorizontalList(
                    text: HomeFont().lowestPrice,
                    title: HomeFont().payLessGetMore,
                    data: homeCtrl.lowerPriceList,
                  ),

                  const Space(0, 20),
                  //Everyday Essentials layout
                  CommonHorizontalList(
                    text: HomeFont().everydayEssentials,
                    title: HomeFont().payLessGetMore,
                    data: homeCtrl.everyDayEssentialList,
                  ),
                ],
              ));
        });
      }
    );
  }
}
