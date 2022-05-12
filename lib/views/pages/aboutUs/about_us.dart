import 'package:fastkart/controllers/about_us_controller.dart';
import 'package:fastkart/views/pages/aboutUs/util/about_us_constants.dart';
import 'package:fastkart/views/pages/aboutUs/util/about_us_fontstyle.dart';
import 'package:fastkart/views/pages/aboutUs/util/about_us_widget.dart';
import 'package:flutter/material.dart';
import '../../../config.dart';

class AboutUs extends StatelessWidget {
  var aboutUsCtrl = Get.put(AboutUsController());

  AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<AboutUsController>(builder: (_) {
          return Scaffold(
            //app bar layout
            appBar: AboutUsWidget().appBarLayout(
                bgColor: aboutUsCtrl.appCtrl.appTheme.whiteColor,
                titleColor: aboutUsCtrl.appCtrl.appTheme.titleColor,
                image: aboutUsCtrl.appCtrl.isTheme
                    ? imageAssets.themeFkLogo
                    : imageAssets.fkLogo,
                onTap: () => aboutUsCtrl.goToHome()),
            backgroundColor: aboutUsCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: SingleChildScrollView(
                child: Container(
                  color: aboutUsCtrl.appCtrl.appTheme.whiteColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //image layout
                        Image.asset(imageAssets.aboutUs),
                        Space(0, 20),
                        //who we are text layout
                        AboutUsWidget().commonTitle(
                            text: AboutUsFont().whoWeAre,
                            color: aboutUsCtrl.appCtrl.appTheme.titleColor),

                        Space(0, 5),
                        //who we are value layout
                        AboutUsFontStyle().mulishtextLayout(
                            text: AboutUsFont().desc,
                            height: 1.5,
                            color:
                                aboutUsCtrl.appCtrl.appTheme.darkContentColor,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.clip,
                            fontSize: AboutUsFontSize.textSizeSmall),
                        Space(0, 30),
                        //how do order text layout
                        AboutUsWidget().commonTitle(
                            text: AboutUsFont().howDoOrder,
                            color: aboutUsCtrl.appCtrl.appTheme.titleColor),
                        Space(0, 20),
                        //how do order list layout
                        AboutUsWidget().howDoOrderLayout(
                            containerColor:
                                aboutUsCtrl.appCtrl.appTheme.wishtListBoxColor,
                            titleColor: aboutUsCtrl.appCtrl.appTheme.titleColor,
                            darkContentColor:
                                aboutUsCtrl.appCtrl.appTheme.darkContentColor,
                            primaryColor: aboutUsCtrl.appCtrl.appTheme.primary,
                            whiteColor: aboutUsCtrl.appCtrl.appTheme.white),

                        Space(0, 30),
                        //People who Build Fastkart text layout
                        AboutUsWidget().commonTitle(
                            text: AboutUsFont().peopleWhoBuildFastkart,
                            color: aboutUsCtrl.appCtrl.appTheme.titleColor),
                        Space(0, 20),

                        //team list
                        Container(
                          child: AboutUsWidget().teamListLayout(
                              lightPrimaryColor:
                                  aboutUsCtrl.appCtrl.appTheme.lightPrimary,
                              titleColor:
                                  aboutUsCtrl.appCtrl.appTheme.titleColor,
                              context: context),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
