import 'package:fastkart/config.dart';
import 'package:fastkart/views/orderPages/orderTrack/util/orderTrack_constants.dart';
import 'package:fastkart/views/orderPages/orderTrack/util/orderTrack_fontstyle.dart';
import 'package:flutter/material.dart';

//Widget Layout
class OrderTrackWidget {
  //appbar leading layout
  Widget appBarLeadingLayput(
      {GestureTapCallback? onTap,
      var borderColor,
      var iconColor,
      String? image}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            width: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            margin: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.arrow_back_sharp,
              size: AppScreenUtil().size(14),
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? image, var textColor, bool? isTheme}) {
    return Image.asset(
      image!,
      width: AppScreenUtil().screenWidth(100),
    );
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(13),
          top: AppScreenUtil().screenHeight(13),
          right: AppScreenUtil().screenWidth(15)),
      child: Image.asset(
        iconAssets.drawerHome,
        color: iconColor,
        height: AppScreenUtil().screenHeight(20),
        fit: BoxFit.contain,
      ),
    );
  }

  //orderTrack button layout
  Widget orderTrackButtonLayout({context, var buttonColor, var itemColor,GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppScreenUtil().screenHeight(45),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(10)),
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(20),
            vertical: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: OrderTrackFontStyle().mulishtextLayout(
            text: OrderTrackFont().orderDetail,
            color: itemColor,
            fontSize: OrderTrackFontSize.textSizeMedium),
      ),
    );
  }

  //background layout
  Widget backgroundLayout({context}) {
    return Image.asset(
      imageAssets.mapSection,
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height /1.7,
      fit: BoxFit.fill,
    );
  }

  //content background layout
  Widget contentBGLayout({var color, Widget? child, context}) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height /2.2),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(20)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(20)))),
      child: child,
    );
  }

  //user widget layout
  Widget userLayout({String? image, var titleColor, var darkContentColor}) {
    return Row(
      children: [
        Image.asset(
          image!,
          height: AppScreenUtil().screenHeight(50),
        ),
        Space(10, 0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderTrackFontStyle().mulishtextLayout(
                text: "Andrea Joanne",
                fontSize: OrderTrackFontSize.textSizeSMedium,
                color: titleColor),
            OrderTrackFontStyle().mulishtextLayout(
                text: OrderTrackFont().courier,
                fontSize: OrderTrackFontSize.textSizeSMedium,
                color: darkContentColor),
          ],
        )
      ],
    );
  }

  //common layout for call and chat
  Widget commonLayoutForIcon({String? image, var boxColor, var borderColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(10),
          vertical: AppScreenUtil().screenHeight(8)),
      decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: Image.asset(
        image!,
        height: AppScreenUtil().screenHeight(20),
      ),
    );
  }
}
