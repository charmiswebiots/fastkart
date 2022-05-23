import '../../../config.dart';

class AppBarWidget {
  //common icon image layout
  Widget commonIconImage(
      {String? image, double? height, GestureTapCallback? onTap, var color}) {
    return InkWell(
        onTap: onTap,
        child: Image.asset(
          image!,
          height: height,
          color: color,
        ));
  }

  //back to home widget
  Widget backToHomeWidget(
      {String? text,
      color,
      GestureTapCallback? onTap,
      fontColor,
      BuildContext? context}) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context!).size.width / 2.5,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
          child: AppBarFontStyle().mulishtextLayout(
              text: text,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: fontColor),
        ));
  }

  //home icon
  Widget homeIcon({isRTL, GestureTapCallback? actionTap}) {
    return InkWell(
        onTap: actionTap,
        child: Padding(
            padding: EdgeInsets.only(
              right: AppScreenUtil().screenHeight(15),
              left: AppScreenUtil().screenHeight(isRTL ? 15 : 0),
            ),
            child: Image.asset(
              iconAssets.colorHome,
              height: 20,
              fit: BoxFit.contain,
            )));
  }

  //appbar layout
  Widget appBarLayout({Widget? child,context}){
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height /
            AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 15 : 22),
        bottom: AppScreenUtil().screenHeight(10),
      ),
      child: child,
    );
  }
}
