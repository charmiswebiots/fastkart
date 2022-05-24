import '../../../../config.dart';

class OfferDetailContent extends StatelessWidget {
  final dynamic data;
  const OfferDetailContent({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return BottomSheetLayout().bottomSheetLayout(
            primaryColor: appCtrl.appTheme.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OfferFontStyle().quicksandtextLayout(
                    text: OfferFont().flat + " ${data['discount']}% " + OfferFont().off,
                    color: appCtrl.appTheme.white,
                    fontSize: OfferFontSize.textSizeNormal,
                    fontWeight: FontWeight.bold),
                const Space(0, 10),
                OfferFontStyle().quicksandtextLayout(
                    text: data['des'],
                    color: appCtrl.appTheme.white,
                    fontSize: OfferFontSize.textSizeSMedium,
                    fontWeight: FontWeight.normal),
                const Space(0, 10),
                OfferWidget().codeLayout(
                    lightPrimary: appCtrl.appTheme.white.withOpacity(.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            OfferFontStyle().mulishtextLayout(
                                text: OfferFont().code,
                                color: appCtrl.appTheme.white,
                                fontSize: OfferFontSize.textSizeSMedium,
                                fontWeight: FontWeight.normal),
                            const Space(5, 0),
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
            ));
      }
    );
  }
}
