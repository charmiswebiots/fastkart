import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/config.dart';
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

  //recent bought List
  Widget recentBoughtListWiget(
      {BuildContext? context,
      containercolor,
      bordercolor,
      String? title,
      titlecolor,
      var list,
      listcontainercolor}) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: AppScreenUtil().screenHeight(15),
              right: AppScreenUtil().screenHeight(15)),
          width: MediaQuery.of(context!).size.width,
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().size(15),
              vertical: AppScreenUtil().size(18)),
          decoration: BoxDecoration(
              color: containercolor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              border: Border.all(color: bordercolor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //recent bought widget
              HomeWidget().recentlyBought(text: title, color: titlecolor),
              Space(0, 20),
              Container(
                height: 60,
                child: ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    //  print(AppArray().recentBoughtList[index]);
                    return Container(
                      margin: EdgeInsets.only(right: AppScreenUtil().size(15)),
                      padding: EdgeInsets.symmetric(
                          vertical: AppScreenUtil().size(12),
                          horizontal: AppScreenUtil().size(12)),
                      decoration: BoxDecoration(
                          color: listcontainercolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        list[index]['image'].toString(),
                        fit: BoxFit.fill,
                        height: AppScreenUtil().size(30),
                        width: AppScreenUtil().size(30),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 15,
            child: Image.asset(imageAssets.corner))
      ],
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
          Container(
            child: SizedBox(
              width: MediaQuery.of(context!).size.width / 4,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: bordercolor, width: 2),
              ),
            ),
          ),
          HomeWidget().shopByCategory(text: title, color: titlecolor),
          Container(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: bordercolor, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
