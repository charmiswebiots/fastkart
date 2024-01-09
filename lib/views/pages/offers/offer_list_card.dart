import 'package:fastkart/views/pages/offers/util/offer_discount_layout.dart';

import '../../../config.dart';

class OfferListCardLayout extends StatelessWidget {
  final dynamic data;
  final Color? primaryColor;
  final Color? titleColor;
  final Color? darkContentColor;
  final Color? whiteColor;
  final bool? isTheme;
  final GestureTapCallback? onTap;

  const OfferListCardLayout(
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
                OfferDiscountLayout(data: data,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OfferStyle().useCodeText(
                        text: OfferFont().useCode, titleColor: titleColor),
                    const Space(0, 2),
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
