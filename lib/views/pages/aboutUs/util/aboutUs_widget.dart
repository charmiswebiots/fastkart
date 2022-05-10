import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/aboutUs/howDoOrderCard.dart';
import 'package:fastkart/views/pages/aboutUs/teamListCard.dart';
import 'package:fastkart/views/pages/aboutUs/util/aboutUs_constants.dart';
import 'package:fastkart/views/pages/aboutUs/util/aboutUs_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class AboutUsWidget {
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
  Widget appBarTitleLayout({String? text, var textColor}) {
    return AboutUsFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor,GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 15 :20),
          top: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 13 :20),
          right: AppScreenUtil().screenWidth(15)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          iconAssets.drawerHome,
          color: iconColor,
          height: AppScreenUtil().screenHeight(20),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  //common title
  Widget commonTitle({String? text, var color}){
    return //who we are text layout
      AboutUsFontStyle().mulishtextLayout(text: text,color: color,fontWeight: FontWeight.w700,fontSize: AboutUsFontSize.textSizeSMedium);
  }

  //common image layout
  Widget commonImage({String? image}){
    return Image.asset(
      image!,
      height:
      AppScreenUtil().screenHeight(20),
    );
  }

  //app bar layout
  PreferredSizeWidget appBarLayout({var bgColor,var titleColor,String? image,GestureTapCallback? onTap}){
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: AboutUsWidget().appBarLeadingLayput(
          onTap: () => Get.back(),
          borderColor:titleColor,
          iconColor:titleColor,
          image: image),
      title: AboutUsWidget().appBarTitleLayout(
          text: AboutUsFont().aboutUs,
          textColor:titleColor),
      actions: [
        AboutUsWidget().appBarActionLayout(
            iconColor:titleColor,onTap: onTap),
      ],
    );
  }

  //team list card
  Widget teamListLayout({var lightPrimaryColor,var titleColor,context}){
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: AppArray().teamList.length,
        itemBuilder: (context, index) {
          return TeamListCard(
            data: AppArray().teamList[index],
            lightPrimaryColor:
            lightPrimaryColor,
            titleColor: titleColor,
          );
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
    );
  }

  //how do order list layout
  Widget howDoOrderLayout({var containerColor, var titleColor,var darkContentColor,var primaryColor,var whiteColor}){
    return Container(
      height: AppScreenUtil().screenHeight(
          AppScreenUtil().screenActualWidth() > 370
              ? 430
              : 450),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: AppArray().howToOrder.length,
        itemBuilder: (context, index) {
          return HowDoOrderCard(
            data: AppArray().howToOrder[index],
            containerColor: containerColor,
            titleColor: titleColor,
            darkContentColor: darkContentColor,
            primaryColor: primaryColor,
            whiteColor:whiteColor,
          );
        },
      ),
    );
}
}
