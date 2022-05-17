import 'package:fastkart/common/app_screen_util.dart';
import 'package:fastkart/config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Scaffold(
        appBar: AppBar(
          leading: Container(
            color: appCtrl.appTheme.lightGray,
            height: AppScreenUtil().screenHeight(20),
            width: AppScreenUtil().screenWidth(20),
          ),
          title: Container(
            decoration: BoxDecoration(
                color: appCtrl.appTheme.lightGray,
                borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(20))
            ),
            height: AppScreenUtil().screenHeight(10),
            width: AppScreenUtil().screenWidth(150),
          ),
        ),
        body: Shimmer.fromColors(
            baseColor: appCtrl.appTheme.gray.withOpacity(.5),
            highlightColor: appCtrl.appTheme.gray.withOpacity(.2),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                  color: appCtrl.appTheme.lightGray,
                  height: AppScreenUtil().screenHeight(45),
                  width: MediaQuery.of(context).size.width,
                )
              ],
            )),
      );
    });
  }
}
