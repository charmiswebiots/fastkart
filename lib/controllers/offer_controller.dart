import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/offers/util/offer_constants.dart';
import 'package:fastkart/views/pages/offers/util/offer_fontstyle.dart';
import 'package:fastkart/views/pages/offers/util/offer_widget.dart';
import 'package:flutter/material.dart';

class OfferController extends GetxController {
  bottomSheet(
      {var primaryColor,
      data,
      var whiteColor,
      var lightPrimary,
      var termConditionColor,context}) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      // context and builder are
      // required properties in this widget
      context: context,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text
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
                    primaryColor: primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OfferFontStyle().quicksandtextLayout(
                            text: "Flat ${data['discount']}% off",
                            color: whiteColor,
                            fontSize: OfferFontSize.textSizeNormal,
                            fontWeight: FontWeight.bold),
                        Space(0, 10),
                        OfferFontStyle().quicksandtextLayout(
                            text: data['des'],
                            color: whiteColor,
                            fontSize: OfferFontSize.textSizeSMedium,
                            fontWeight: FontWeight.normal),
                        Space(0, 10),
                        OfferWidget().codeLayout(lightPrimary: lightPrimary,child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                OfferFontStyle().mulishtextLayout(
                                    text: "Code:",
                                    color: whiteColor,
                                    fontSize: OfferFontSize.textSizeSMedium,
                                    fontWeight: FontWeight.normal),
                                Space(5, 0),
                                OfferFontStyle().mulishtextLayout(
                                    text: data['code'],
                                    color: whiteColor,
                                    fontSize: OfferFontSize.textSizeSMedium,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                            OfferWidget().copyCodeButton(
                              text: OfferFont().copyCode,
                              whiteColor: whiteColor,
                              primaryColor: primaryColor
                            )
                          ],
                        ))
                      ],
                    )),
                Space(0, 10),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(20),
                      right: AppScreenUtil().screenWidth(20)),
                  child: OfferFontStyle().mulishtextLayout(
                      text: OfferFont().termsConditions,
                      color: termConditionColor,
                      fontSize: OfferFontSize.textSizeSMedium,
                      fontWeight: FontWeight.w600),
                ),
                Space(0, 10),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(20),
                      right: AppScreenUtil().screenWidth(20)),
                  child: OfferFontStyle().mulishtextLayout(
                      text:
                          "1. Information on how to participate forms part of these Terms & Conditions. By participating, claimants agree to be bound by these Terms & Conditions. Claimants must comply with these Terms & Conditions for a coupon to be valid.",
                      color: termConditionColor,
                      fontSize: OfferFontSize.textSizeSmall,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.normal),
                ),
                Space(0, 20),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(20),
                      right: AppScreenUtil().screenWidth(20)),
                  child: OfferFontStyle().mulishtextLayout(
                      text:
                          "2. Each claimant is entitled to one coupon per accommodation establishment. Coupons are not transferable and are not redeemable for cash and cannot be combined with any other coupons or any other offer or discounts or promotions offered ",
                      color: termConditionColor,
                      fontSize: OfferFontSize.textSizeSmall,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ));
      },
    );
  }
}
