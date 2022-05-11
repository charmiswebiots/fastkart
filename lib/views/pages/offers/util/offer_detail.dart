import '../../../../config.dart';

class OfferDetail extends StatelessWidget {
  var data;

  OfferDetail({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
          ),
          height: AppScreenUtil().screenHeight(500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OfferWidget().bottomSheetLayout(
                  primaryColor: appCtrl.appTheme.primary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OfferFontStyle().quicksandtextLayout(
                          text: "Flat ${data['discount']}% off",
                          color: appCtrl.appTheme.white,
                          fontSize: OfferFontSize.textSizeNormal,
                          fontWeight: FontWeight.bold),
                      Space(0, 10),
                      OfferFontStyle().quicksandtextLayout(
                          text: data['des'],
                          color: appCtrl.appTheme.white,
                          fontSize: OfferFontSize.textSizeSMedium,
                          fontWeight: FontWeight.normal),
                      Space(0, 10),
                      OfferWidget().codeLayout(
                          lightPrimary: appCtrl.appTheme.white.withOpacity(.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  OfferFontStyle().mulishtextLayout(
                                      text: "Code:",
                                      color: appCtrl.appTheme.white,
                                      fontSize: OfferFontSize.textSizeSMedium,
                                      fontWeight: FontWeight.normal),
                                  Space(5, 0),
                                  OfferFontStyle().mulishtextLayout(
                                      text: data['code'],
                                      color: appCtrl.appTheme.white,
                                      fontSize: OfferFontSize.textSizeSMedium,
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                              OfferWidget().copyCodeButton(
                                  text: OfferFont().copyCode,
                                  whiteColor: appCtrl.appTheme.white,
                                  primaryColor: appCtrl.appTheme.primary)
                            ],
                          ))
                    ],
                  )),
              Space(0, 10),
              OfferStyle().termsAndCondition(appCtrl.appTheme.darkContentColor),
              Space(0, 10),
              OfferStyle().commonDescriptionText(
                  color: appCtrl.appTheme.darkContentColor,
                  text: OfferFont().desc1),
              Space(0, 20),
              OfferStyle().commonDescriptionText(
                  color: appCtrl.appTheme.darkContentColor,
                  text: OfferFont().desc2),
            ],
          ));
    });
  }
}
