import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/widgets/common_appbar_widget/util/appbar_constants.dart';
import 'package:fastkart/widgets/common_appbar_widget/util/appbar_fontstyle.dart';
import 'package:fastkart/widgets/common_appbar_widget/util/appbar_widget.dart';
import 'package:flutter/material.dart';

class CommonAppBar1 extends StatelessWidget {
  GestureTapCallback? onTap;
  CommonAppBar1({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(

          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarWidget().commonIconImage(
                onTap: onTap,
                  image: iconAssets.category, height: 20),
              Space(10, 0),
              AppBarWidget().commonIconImage(
                  image: imageAssets.smallLogoImage, height: 16),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarWidget().commonIconImage(
                  image: iconAssets.location, height: 16),
              Space(5, 0),
              AppBarFontStyle().mulishtextLayout(
                  text: AppBarFont().name,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
              Space(5, 0),
              AppBarWidget()
                  .commonIconImage(image: iconAssets.user, height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
