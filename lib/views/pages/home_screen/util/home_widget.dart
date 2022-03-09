import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/home_screen/everyday_essential_Card.dart';
import 'package:fastkart/views/pages/home_screen/lowestPriceCard.dart';
import 'package:fastkart/views/pages/home_screen/offer_list.dart';
import 'package:fastkart/views/pages/home_screen/recentBought_list.dart';
import 'package:fastkart/views/pages/home_screen/util/home_constants.dart';
import 'package:fastkart/views/pages/home_screen/util/home_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class HomeWidget {
  //textformfield layout
  Widget textFieldLayout(
      {String? text,
      fillcolor,
      borderColor,
      hintColor,
      Widget? suffixIcon,
      Widget? prefixIcon}) {
    return TextField(
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: -2, horizontal: 20),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: fillcolor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
              fontSize: AppScreenUtil().fontSize(15),
              color: hintColor,
              fontFamily: GoogleFonts.mulish().fontFamily)),
    );
  }

  //recently bought widget
  Widget recentlyBought({String? text, color}) {
    return HomeFontStyle()
        .mulishtextLayout(text: text, color: color, fontSize: 14);
  }

  //shop by category widget
  Widget shopByCategory({String? text, color}) {
    return HomeFontStyle().mulishtextLayout(
        text: text, color: color, fontSize: 14, fontWeight: FontWeight.w600);
  }

//line border widget
  Widget lineBorderWidget({BuildContext? context, var bordercolor}) {
    return Container(
      child: SizedBox(
        width:
            MediaQuery.of(context!).size.width / AppScreenUtil().screenWidth(4),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: bordercolor, width: 2),
        ),
      ),
    );
  }

  //shop by category text layout widget
  Widget shopByCategoryText(
      {BuildContext? context, bordercolor, titlecolor, String? title}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          lineBorderWidget(context: context, bordercolor: bordercolor),
          HomeWidget().shopByCategory(text: title, color: titlecolor),
          lineBorderWidget(context: context, bordercolor: bordercolor),
        ],
      ),
    );
  }

  //common title and see all widget
  Widget commonTitleAndSeeAllWidget(
      {String? title, String? seeAllText, var seeAllColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeFontStyle().mulishtextLayout(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: textSizeSMedium),
        HomeFontStyle().mulishtextLayout(
            text: seeAllText, fontSize: 12, color: seeAllColor),
      ],
    );
  }

  //offer list and content widget layout
  Widget offerListAndContentWidget(
      {BuildContext? context,
      var containerColor,
      var seeAllColor,
      var descriptionColor}) {
    return Container(
      height: MediaQuery.of(context!).size.height * 70/100,
      width: MediaQuery.of(context).size.width,
      color: containerColor,
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //say hello and see all  widget
          Padding(
            padding: EdgeInsets.only(
              top: AppScreenUtil().screenHeight(30),
            ),
            child: HomeWidget().commonTitleAndSeeAllWidget(
                title: HomeFont().sayHelloToOffer,
                seeAllText: HomeFont().seeAll,
                seeAllColor: seeAllColor),
          ),
          //best price widget
          HomeWidget().commonDescriptionTextWidget(
              text: HomeFont().bestPriceEverOfAllTheTime,
              color: descriptionColor),
          //offer list
          ...AppArray().offerList.map((e) {
            return OfferListCard(
              data: e,
            );
          }).toList(),
        ],
      ),
    );
  }

  //common description text Widget
  Widget commonDescriptionTextWidget({String? text, var color}) {
    return HomeFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.normal,
        fontSize: textSizeSmall,
        color: color);
  }

  //Common Horizontal lisr=t layout
  Widget commonHorizontalListLayout(
      {BuildContext? context, String? title,String? seeAllText,var data,var lowestPriceColor,
        var payLessColor,
        var containerBorderColor,
        var descriptionColor,
        var priceColor,
        var primaryColor,
        var iconColor,var shadowColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //everyday essential and see all  widget
        commonTitleAndSeeAllWidget(
            title: title,
            seeAllText: seeAllText,
            seeAllColor: lowestPriceColor),

        //popular offers of the day text widget
        commonDescriptionTextWidget(
            text: HomeFont().payLessGetMore, color: payLessColor),
        //lowest price list
        Container(
          height:MediaQuery.of(context!).size.height  * 30/100 ,
          child: ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return EveryDayEssentialCard(
                  index: index,
                  shadowColor: shadowColor,
                  data: data[index],
                  containerBorderColor: containerBorderColor,
                  descriptionColor: descriptionColor,
                  priceColor: priceColor,
                  primaryColor: primaryColor,
                  iconColor: iconColor);
            },
          ),
        )
      ],
    );
  }
}
