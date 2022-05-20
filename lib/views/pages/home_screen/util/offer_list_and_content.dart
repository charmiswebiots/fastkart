import '../../../../config.dart';

class OfferListAndContent extends StatelessWidget {
  const OfferListAndContent({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<HomeController>(builder: (homeCtrl) {
        return Container(
          height: MediaQuery.of(context).size.height *
              (AppScreenUtil().screenActualWidth() > 370 ? 62 : 70) /
              100,
          width: MediaQuery.of(context).size.width,
          color: appCtrl.appTheme.offerBoxColor,
          padding:
              EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //say hello and see all  widget
              HomeStyle().sayHelloLayout(
                  appCtrl.appTheme.titleColor, appCtrl.appTheme.primary),
              const Space(0, 5),
              //best price widget
              HomeWidget().commonDescriptionTextWidget(
                  text: HomeFont().bestPriceEverOfAllTheTime,
                  color: appCtrl.appTheme.darkContentColor),
              Column(
                children: [
                  //offer list
                  ...homeCtrl.offerList.asMap().entries.map((e) {
                    return CommonOfferListCard(
                      onTap: () async {
                        await homeCtrl.appCtrl.getStorage.write(
                            'selectedIndex', homeCtrl.appCtrl.selectedIndex);
                        homeCtrl.appCtrl.selectedIndex = 3;
                        homeCtrl.appCtrl.update();
                      },
                      isColor:false,
                      data: e.value,
                      minusTap: () => homeCtrl.minusTap(e.key),
                      plusTap: () => homeCtrl.plusTap(e.key),
                    );
                  }).toList(),
                ],
              )
            ],
          ),
        );
      });
    });
  }
}
