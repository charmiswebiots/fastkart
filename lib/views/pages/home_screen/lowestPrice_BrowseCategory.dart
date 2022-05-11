import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/responsive_layout.dart';
import 'package:flutter/material.dart';

class LowestPriceAndButton extends StatelessWidget {
  LowestPriceAndButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<HomeController>(builder: (homeCtrl) {
        return Container(
          color: appCtrl.appTheme.whiteColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *
              (ResponsiveWidget.isSmallScreen(context) ? 60 : 65) /
              100,
          padding:
              EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //lowest price layout
              CommonHorizontalList(
                text: HomeFont().lowestPrice,
                title: HomeFont().payLessGetMore,
                data: AppArray().lowerPriceList,
              ),
              Space(0, 20),

              //didn't find what you were looking for text
              HomeStyle().didntFindWhatLookingForLayout(
                  fontColor: appCtrl.appTheme.contentColor,
                  text: HomeFont().didntFindWhatYouWereLookingFor),
              Space(0, 10),

              //browse category button layout
              HomeWidget().browseCategoryButtonLayout(
                buttonColor: appCtrl.appTheme.primary,
                textColor: appCtrl.appTheme.whiteColor,
                onTap: () async {
                  await homeCtrl.appCtrl.getStorage
                      .write('selectedIndex', homeCtrl.appCtrl.selectedIndex);
                  homeCtrl.appCtrl.selectedIndex = 1;
                  homeCtrl.appCtrl.update();
                },
              )
            ],
          ),
        );
      });
    });
  }
}
