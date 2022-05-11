import '../../../config.dart';

class OfferUICard extends StatelessWidget {
  GestureTapCallback? onTap;
  OfferUICard({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GetBuilder<MyCartListController>(
          builder: (wishListCtrl) {
            return InkWell(
              onTap: onTap,
              child: Container(
                height: AppScreenUtil().screenHeight(100),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    left: AppScreenUtil().screenWidth(10),
                    right: AppScreenUtil().screenWidth(10),
                    bottom: AppScreenUtil().screenHeight(15)),
                padding: EdgeInsets.only(
                    left: AppScreenUtil().screenWidth(20),
                    right: AppScreenUtil().screenWidth(22)),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      appCtrl.isTheme
                          ? imageAssets.themeOfferBG
                          : imageAssets.myCartBG,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        MyCartFontStyle().quicksandtextLayout(
                            text: AppArray()
                                .myOfferList[0]['discount']
                                .toString(),
                            color: appCtrl.appTheme.primary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        Space(5, 0),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            MyCartFontStyle()
                                .quicksandtextLayout(
                                text: "%",
                                color:
                                appCtrl.appTheme.primary,
                                fontSize:
                                MyCartFontSize
                                    .textXSizeSmall,
                                fontWeight:
                                FontWeight.normal),
                            MyCartFontStyle()
                                .quicksandtextLayout(
                                text: "OFF",
                                color:
                                appCtrl.appTheme.primary,
                                fontSize:
                                MyCartFontSize
                                    .textXSizeSmall,
                                fontWeight:
                                FontWeight.normal)
                          ],
                        ),
                        Space(5, 0),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            MyCartFontStyle()
                                .quicksandtextLayout(
                                text:
                                AppArray()
                                    .myOfferList[0]
                                ['title']
                                    .toString(),
                                color: appCtrl.appTheme.titleColor,
                                fontSize:
                                MyCartFontSize
                                    .textSizeSmall,
                                fontWeight:
                                FontWeight.normal),
                            Space(0, 2),
                            MyCartFontStyle()
                                .quicksandtextLayout(
                                text:
                                AppArray()
                                    .myOfferList[0]['des']
                                    .toString(),
                                color:
                                appCtrl.appTheme.darkContentColor,
                                fontSize:
                                MyCartFontSize
                                    .textSizeSmall,
                                fontWeight:
                                FontWeight.normal),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        MyCartFontStyle().quicksandtextLayout(
                            text: "Use Code:",
                            color: appCtrl.appTheme.titleColor,
                            fontSize:
                            MyCartFontSize.textSizeSmall,
                            fontWeight: FontWeight.normal),
                        Space(0, 2),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil()
                                  .screenWidth(5)),
                          decoration: BoxDecoration(
                              color: appCtrl.appTheme.primary,
                              borderRadius:
                              BorderRadius.circular(
                                  AppScreenUtil()
                                      .borderRadius(40))),
                          child: MyCartFontStyle()
                              .quicksandtextLayout(
                              text: AppArray()
                                  .myOfferList[0]['code']
                                  .toString(),
                              color: appCtrl.appTheme.whiteColor,
                              fontSize: MyCartFontSize
                                  .textSizeSmall,
                              fontWeight:
                              FontWeight.normal),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }
}
