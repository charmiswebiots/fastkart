import 'package:fastkart/controllers/aboutUs_controller.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/aboutUs/howDoOrderCard.dart';
import 'package:fastkart/views/pages/aboutUs/teamListCard.dart';
import 'package:fastkart/views/pages/aboutUs/util/aboutUs_constants.dart';
import 'package:fastkart/views/pages/aboutUs/util/aboutUs_fontstyle.dart';
import 'package:fastkart/views/pages/aboutUs/util/aboutUs_widget.dart';
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
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: aboutUsCtrl.appCtrl.appTheme.whiteColor,
              titleSpacing: 0,
              centerTitle: false,
              leading: AboutUsWidget().appBarLeadingLayput(
                  onTap: () => Get.back(),
                  borderColor: aboutUsCtrl.appCtrl.appTheme.titleColor,
                  iconColor: aboutUsCtrl.appCtrl.appTheme.titleColor,
                  image: aboutUsCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo),
              title: AboutUsWidget().appBarTitleLayout(
                  text: AboutUsFont().aboutUs,
                  textColor: aboutUsCtrl.appCtrl.appTheme.titleColor),
              actions: [
                AboutUsWidget().appBarActionLayout(
                    iconColor: aboutUsCtrl.appCtrl.appTheme.titleColor,onTap: () => aboutUsCtrl.goToHome()),
              ],
            ),
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
                        Container(
                          height: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 430: 450),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: AppArray().howToOrder.length,
                            itemBuilder: (context, index) {
                              return HowDoOrderCard(
                                data: AppArray().howToOrder[index],
                                containerColor: aboutUsCtrl
                                    .appCtrl.appTheme.wishtListBoxColor,
                                titleColor:
                                    aboutUsCtrl.appCtrl.appTheme.titleColor,
                                darkContentColor: aboutUsCtrl
                                    .appCtrl.appTheme.darkContentColor,
                                primaryColor:
                                    aboutUsCtrl.appCtrl.appTheme.primary,
                                whiteColor: aboutUsCtrl.appCtrl.appTheme.white,
                              );
                            },
                          ),
                        ),

                        Space(0, 30),
                        //People who Build Fastkart text layout
                        AboutUsWidget().commonTitle(
                            text: AboutUsFont().peopleWhoBuildFastkart,
                            color: aboutUsCtrl.appCtrl.appTheme.titleColor),
                        Space(0, 20),

                        //team list
                        Container(
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: AppArray().teamList.length,
                            itemBuilder: (context, index) {
                              return TeamListCard(data: AppArray().teamList[index],lightPrimaryColor: aboutUsCtrl
                                  .appCtrl.appTheme.lightPrimary,titleColor: aboutUsCtrl
                                  .appCtrl.appTheme.titleColor,);
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.6)),
                          ),
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
