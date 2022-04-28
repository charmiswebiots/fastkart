import 'package:fastkart/config.dart';
import 'package:fastkart/controllers/home_controller.dart';
import 'package:fastkart/views/pages/home_screen/util/home_constants.dart';
import 'package:fastkart/views/pages/home_screen/util/home_fontstyle.dart';
import 'package:flutter/material.dart';

class OfferListCard extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  var data;
  GestureTapCallback? minusTap;
  GestureTapCallback? plusTap;
  OfferListCard({Key? key,this.data,this.plusTap,this.minusTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenHeight(10),
      ),
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenHeight(15),
          horizontal: AppScreenUtil().screenHeight(15)),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: appCtrl.appTheme.whiteColor,
          borderRadius: BorderRadius.circular(
              AppScreenUtil().borderRadius(10))),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              data['image'].toString(),
              fit: BoxFit.fill,
              height: AppScreenUtil().size(45),
              width: AppScreenUtil().size(50),
            ),
            Space(5, 0),
            VerticalDivider(
              color: appCtrl.appTheme.contentColor.withOpacity(.5),
              width: 5,

              thickness: 1,
            ),
            Space(5, 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeFontStyle().mulishtextLayout(
                    text: data['name'],
                    fontSize: 13,
                    color: appCtrl.appTheme.titleColor
                ),
                Space(0, 2),
                HomeFontStyle().mulishtextLayout(
                    text: data['description'],
                    fontSize: 13,
                    color: appCtrl.appTheme.darkContentColor
                ),
                Row(
                  children: [
                    HomeFontStyle().mulishtextLayout(
                        text: HomeFont().dollar +  data['price'].toString(),
                        fontSize: 12,
                        color: appCtrl.appTheme.titleColor,
                        fontWeight: FontWeight.w700
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: appCtrl.appTheme.primary,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      margin: EdgeInsets.only(left: AppScreenUtil().screenHeight(5)),
                      padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10),vertical: AppScreenUtil().screenHeight(3)),
                      child:  HomeFontStyle().mulishtextLayout(
                        text: data['discount'].toString(),
                        fontSize:10,
                        color: appCtrl.appTheme.whiteColor,
                      ),
                    ),
                    Space(45, 0),
                    Container(
                      padding : EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(8),horizontal: AppScreenUtil().screenWidth(8)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                          border: Border.all(color: appCtrl.appTheme.lightPrimary)
                      ),
                      child:GetBuilder<HomeController>(builder: (controller) => Row(
                        children: [
                          InkWell(
                              onTap: minusTap,
                              child: Icon(Icons.remove,size: 18,)),
                          Space(10,0),
                          Text(data['quantity'].toString()),
                          Space(10,0),
                          InkWell(
                              onTap: plusTap,
                              child: Icon(Icons.add,size: 18)),
                        ],
                      ),),
                    )
                  ],
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
