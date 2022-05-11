import '../../../config.dart';

class OfferListCardLayout extends StatelessWidget {
  var data;
  var primaryColor;
  var titleColor;
  var darkContentColor;
  var whiteColor;
  bool? isTheme;
  GestureTapCallback? onTap;

  OfferListCardLayout(
      {Key? key,
      this.whiteColor,
      this.darkContentColor,
      this.titleColor,
      this.primaryColor,
      this.data,
      this.onTap,
      this.isTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: OfferStyle().cardBGLayout(
          context: context,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    OfferFontStyle().quicksandtextLayout(
                        text: data['discount'],
                        color: primaryColor,
                        fontSize: OfferFontSize.textSizeXLarge,
                        fontWeight: FontWeight.bold),
                    Space(5, 0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OfferFontStyle().quicksandtextLayout(
                            text: "%",
                            color: primaryColor,
                            fontSize: OfferFontSize.textSizeSMedium,
                            fontWeight: FontWeight.normal),
                        OfferFontStyle().quicksandtextLayout(
                            text: "OFF",
                            color: primaryColor,
                            fontSize: OfferFontSize.textSizeSmall,
                            fontWeight: FontWeight.normal)
                      ],
                    ),
                    Space(5, 0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OfferFontStyle().quicksandtextLayout(
                            text: data['title'],
                            color: titleColor,
                            fontSize: OfferFontSize.textSizeSmall,
                            fontWeight: FontWeight.normal),
                        Space(0, 2),
                        OfferFontStyle().quicksandtextLayout(
                            text: data['des'],
                            color: darkContentColor,
                            fontSize: OfferFontSize.textSizeSmall,
                            fontWeight: FontWeight.normal),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OfferStyle().useCodeText(
                        text: OfferFont().useCode, titleColor: titleColor),
                    Space(0, 2),
                    OfferStyle().codeValueLayout(
                        text: data['code'],
                        whiteColor: whiteColor,
                        primaryColor: primaryColor)
                  ],
                )
              ],
            ),
            isTheme: isTheme!));
  }
}
