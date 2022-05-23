import '../../../config.dart';

class AppBarStyle{
  //category icon
  Widget categoryIcon({isRTL, GestureTapCallback? onTap, var color}) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppScreenUtil().screenHeight(15),
        right: AppScreenUtil().screenHeight(isRTL ? 15 : 0),
      ),
      child: AppBarWidget().commonIconImage(
          onTap: onTap, image: iconAssets.category, height: 20, color: color),
    );
  }

  //offer icon
  Widget offerIcon({isRTL, GestureTapCallback? actionTap}) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppScreenUtil().screenHeight(15),
        left: AppScreenUtil().screenHeight(isRTL ? 15 : 0),
      ),
      child: InkWell(
          onTap: actionTap,
          child: Image.asset(gifAssets.colorOffer, height: 30)),
    );
  }


}