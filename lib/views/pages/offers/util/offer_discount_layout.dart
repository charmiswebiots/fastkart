import '../../../../config.dart';

class OfferDiscountLayout extends StatelessWidget {
  final dynamic data;
  const OfferDiscountLayout({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            OfferFontStyle().quicksandtextLayout(
                text: data['discount'],
                color: appCtrl.appTheme.primary,
                fontSize: OfferFontSize.textSizeLarge,
                fontWeight: FontWeight.bold),
            const Space(5, 0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OfferFontStyle().quicksandtextLayout(
                    text: "%",
                    color:  appCtrl.appTheme.primary,
                    fontSize: OfferFontSize.textSizeSMedium,
                    fontWeight: FontWeight.normal),
                OfferFontStyle().quicksandtextLayout(
                    text: OfferFont().off,
                    color:  appCtrl.appTheme.primary,
                    fontSize: OfferFontSize.textSizeSmall,
                    fontWeight: FontWeight.normal)
              ],
            ),
            const Space(8, 0),
            SizedBox(
              width: AppScreenUtil().screenWidth(150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OfferFontStyle().quicksandtextLayout(
                      text: data['title'],
                      color:  appCtrl.appTheme.titleColor,
                      fontSize: OfferFontSize.textSizeSmall,
                      fontWeight: FontWeight.normal),
                  const Space(0, 2),
                  OfferFontStyle().quicksandtextLayout(
                      text: data['des'] + 'dsfsd',
                      textAlign: TextAlign.start,
                      textOverflow: TextOverflow.clip,
                      color: appCtrl.appTheme.darkContentColor,
                      fontSize: OfferFontSize.textSizeSmall,
                      fontWeight: FontWeight.w700),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
