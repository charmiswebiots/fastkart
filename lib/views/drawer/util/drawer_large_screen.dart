import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/drawer/contact_us.dart';
import 'package:fastkart/views/drawer/util/drawer_constants.dart';
import 'package:fastkart/views/drawer/util/drawer_fontstyle.dart';
import 'package:fastkart/views/drawer/util/drawer_header.dart';
import 'package:fastkart/views/drawer/util/drawer_widget.dart';
import 'package:flutter/material.dart';

class DrawerLargeScreen extends StatelessWidget {
  const DrawerLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appCtrl = Get.isRegistered<AppController>()
        ? Get.find<AppController>()
        : Get.put(AppController());

    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppScreenUtil().borderRadius(20)),
          bottomRight: Radius.circular(AppScreenUtil().borderRadius(20))),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: Container(
          width: MediaQuery.of(context).size.width *
              AppScreenUtil().screenWidth(0.75),
          child: Drawer(
              child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            //Drawer header
                            DrawerCustomHeader(
                                borderRaius: 50,
                                image: imageAssets.usersquare,
                                imageHeight: 50,
                                userName: DrawerFont().userName,
                                userEmail: DrawerFont().userEmail,
                                userNameFontColor: appCtrl.appTheme.titleColor,
                                emailFontColor:
                                    appCtrl.appTheme.darkContentColor,
                                nameFontSize: 14,
                                emailFontSize: 12),

                            //divider layout
                            DrawerWidget().dividerLineLayout(
                                height: 48,
                                horizontalPadding: 10,
                                color: appCtrl.appTheme.borderGray),

                            //drawer list
                            ...AppArray().drawerList.map((e) {
                              return DrawerWidget().commonDrawerListTile(
                                  image: e['icon'],
                                  title: e['title'],
                                  color: appCtrl.appTheme.lightPrimary,
                                  onTap: () {
                                    print('tap');
                                   
                                  },
                                  iconColor: appCtrl.appTheme.titleColor,
                                  height: 22,
                                  fontSize: 14);
                            }).toList(),

                            /*   DrawerWidget().commonDrawerListTile(
                                    image: iconAssets.drawerHome,
                                    title: DrawerFont().home,
                                    color: appCtrl.appTheme.lightPrimary,
                                    iconColor: appCtrl.appTheme.titleColor,height: 22,fontSize: 14),
                                DrawerWidget().commonDrawerListTile(
                                    image: iconAssets.category,
                                    title: DrawerFont().shopByCategory,
                                    color: appCtrl.appTheme.lightPrimary,
                                    iconColor: appCtrl.appTheme.titleColor,height: 22,fontSize: 14),
                                DrawerWidget().commonDrawerListTile(
                                    image: iconAssets.orders,
                                    title: DrawerFont().orders,
                                    color: appCtrl.appTheme.lightPrimary,
                                    iconColor: appCtrl.appTheme.titleColor,height: 22,fontSize: 14),
                                DrawerWidget().commonDrawerListTile(
                                    image: iconAssets.simpleheart,
                                    title: DrawerFont().yourWishlist,
                                    color: appCtrl.appTheme.lightPrimary,
                                    iconColor: appCtrl.appTheme.titleColor,height: 22,fontSize: 14),
                                DrawerWidget().commonDrawerListTile(
                                    image: iconAssets.language,
                                    title: DrawerFont().language,
                                    color: appCtrl.appTheme.lightPrimary,
                                    iconColor: appCtrl.appTheme.titleColor,height: 22,fontSize: 14),

                                DrawerWidget().commonDrawerListTile(
                                    image: iconAssets.profile,
                                    title: DrawerFont().yourAccount,
                                    color: appCtrl.appTheme.lightPrimary,
                                    iconColor: appCtrl.appTheme.titleColor,height: 22,fontSize: 14),
                                DrawerWidget().commonDrawerListTile(
                                    image: iconAssets.notification,
                                    title: DrawerFont().notification,
                                    color: appCtrl.appTheme.lightPrimary,
                                    iconColor: appCtrl.appTheme.titleColor,height: 22,fontSize: 14),
                                DrawerWidget().commonDrawerListTile(
                                    image: iconAssets.setting,
                                    title: DrawerFont().setting,
                                    color: appCtrl.appTheme.lightPrimary,
                                    iconColor: appCtrl.appTheme.titleColor,height: 22,fontSize: 14),
                                DrawerWidget().commonDrawerListTile(
                                    image: iconAssets.darkTheme,
                                    title: DrawerFont().darkTheme,
                                    color: appCtrl.appTheme.lightPrimary,
                                    iconColor: appCtrl.appTheme.titleColor,height: 22,fontSize: 14),
                                DrawerWidget().commonDrawerListTile(
                                    image: iconAssets.darkTheme,
                                    title: DrawerFont().darkTheme,
                                    color: appCtrl.appTheme.lightPrimary,
                                    iconColor: appCtrl.appTheme.titleColor,height: 22,fontSize: 14),*/
                            Space(0, 200)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ContactUsLayout(
                height: 150,
                containerColor: appCtrl.appTheme.lightPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //contact support text layout
                    DrawerWidget().contactSupport(
                        title: DrawerFont().contactSupport,
                        fontSize: 13,
                        color: appCtrl.appTheme.titleColor),
                    Space(0, 5),

                    //contact support description
                    DrawerFontStyle().mulishtextLayout(
                        text: DrawerFont().contactSupportDesc,
                        fontSize: 12,
                        color: appCtrl.appTheme.darkContentColor,
                        overflow: TextOverflow.clip),
                    Space(0, 15),

                    //contact us button
                    DrawerWidget().contactUsButtonLayout(
                        text: DrawerFont().contactUs,
                        buttonColor: appCtrl.appTheme.primary,
                        textColor: appCtrl.appTheme.white)
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
