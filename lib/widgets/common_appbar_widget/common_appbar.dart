import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/widgets/common_appbar_widget/util/appbar_constants.dart';
import 'package:fastkart/widgets/common_appbar_widget/util/appbar_fontstyle.dart';
import 'package:fastkart/widgets/common_appbar_widget/util/appbar_widget.dart';
import 'package:flutter/material.dart';

class CommonAppBar1 extends StatelessWidget {
  GestureTapCallback? onTap;
  bool? isLocation;
  bool? isCart;
  bool? isCategory;
  bool? isback;
  bool? isWishListText;
  bool? isHome;
  var color;
  bool? isTheme;
  var borderColor;

  CommonAppBar1(
      {Key? key,
      this.onTap,
      this.isCart,
      this.isLocation,
      this.isback,
      this.isHome,this.borderColor,
        this.isWishListText,
      this.isCategory,this.color,this.isTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height /
              AppScreenUtil().screenHeight(13),
          bottom: AppScreenUtil().screenHeight(10),
          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isCategory!)
                AppBarWidget().commonIconImage(
                    onTap: onTap, image: iconAssets.category, height: 20,color: color),
              if (isback!)
                InkWell(
                  onTap: onTap,
                  child: Container(
                    height: AppScreenUtil().screenHeight(
                        AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
                    width: AppScreenUtil().screenHeight(
                        AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),

                    decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 1.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.arrow_back_sharp,
                      size: AppScreenUtil().size(14),
                      color: color,
                    ),
                  ),
                ),
              Space(10, 0),
              AppBarWidget().commonIconImage(
                  image: isTheme! ? imageAssets.themeLogo : imageAssets.smallLogoImage, height: 16),
              Space(10, 0),
              if(isWishListText!)
                AppBarFontStyle().mulishtextLayout(
                    text: "(4 Items)",
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
            ],
          ),
          if (isLocation!)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppBarWidget()
                    .commonIconImage(image: iconAssets.location, height: 16,color: color),
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
          if (isCart!) Image.asset(gifAssets.colorOffer, height: 30),

          if (isHome!) Image.asset(iconAssets.colorHome, height: 20,fit: BoxFit.contain,),
        ],
      ),
    );
  }
}
