import 'package:fastkart/controllers/offer_controller.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/offers/offerListCard.dart';
import 'package:fastkart/views/pages/offers/util/offer_constants.dart';
import 'package:fastkart/views/pages/offers/util/offer_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  var offerCtrl = Get.put(OfferController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferController>(builder: (_) {
      return Scaffold(
        backgroundColor: appCtrl.appTheme.blackColor,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return false;
          },
          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                alignment: Alignment.bottomCenter,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //search product textformfield layout
                          Padding(
                            padding: EdgeInsets.only(
                                left: AppScreenUtil().screenHeight(15),
                                right: AppScreenUtil().screenHeight(15)),
                            child: OfferWidget().textFieldLayout(
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppScreenUtil().screenHeight(10)),
                                child: Image.asset(
                                  iconAssets.voice,
                                  fit: BoxFit.contain,
                                  color: appCtrl.appTheme.titleColor,
                                  height: AppScreenUtil().screenHeight(10),
                                  width: AppScreenUtil().screenWidth(10),
                                ),
                              ),
                              prefixIcon: Image.asset(
                                iconAssets.textboxSearchIcon,
                                color: appCtrl.appTheme.titleColor,
                              ),
                              text: OfferFont().searchProduct,
                              borderColor:
                                  appCtrl.appTheme.primary.withOpacity(.3),
                              hintColor: appCtrl.appTheme.contentColor,
                              fillcolor: appCtrl.appTheme.textBoxColor,
                            ),
                          ),
                          Space(0, 20),

                          Container(
                            margin: EdgeInsets.only(
                                left: AppScreenUtil().screenHeight(15),
                                right: AppScreenUtil().screenHeight(15)),
                            child: ListView.builder(
                              itemCount: AppArray().myOfferList.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return OfferListCard(
                                  isTheme: appCtrl.isTheme,
                                  onTap: () => offerCtrl.bottomSheet(
                                    context: context,
                                      primaryColor: appCtrl.appTheme.primary,
                                      data: AppArray().myOfferList[index],
                                      whiteColor: appCtrl.appTheme.white,
                                      termConditionColor: appCtrl.appTheme.darkContentColor,
                                      lightPrimary: appCtrl
                                          .appTheme.white
                                          .withOpacity(.3)),
                                  data: AppArray().myOfferList[index],
                                  primaryColor: appCtrl.appTheme.primary,
                                  titleColor: appCtrl.appTheme.titleColor,
                                  darkContentColor:
                                      appCtrl.appTheme.darkContentColor,
                                  whiteColor: appCtrl.appTheme.whiteColor,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
