import 'package:fastkart/config.dart';

//Widget Layout
class ShopWidget {

  //shop layout
  Widget shopLayout({Widget? child, context}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: AppScreenUtil().screenHeight(10),
      ),
      child: child,
    );
  }

  //voice icon layout
  Widget voiceIcon(color, image) {
    return Image.asset(
      image,
      fit: BoxFit.contain,
      color: color,
      height: AppScreenUtil().screenHeight(10),
      width: AppScreenUtil().screenWidth(10),
    );
  }

  //appbar action layout
  Widget appBarActionLayout({GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(10),
          bottom: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 10 :15),
          top: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 10 :15),
          right: AppScreenUtil().screenWidth(10)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          gifAssets.colorOffer,
          height: AppScreenUtil().screenHeight(25),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  //decorated box layout
  Widget decoratedBoxLayout(
      {var wishtListBoxColor, var borderColor, Widget? child}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: wishtListBoxColor,
        //background color of dropdown button
        border: Border.all(color: borderColor, width: .5),
        //border of dropdown button
        borderRadius: BorderRadius.circular(
            AppScreenUtil().borderRadius(5)), //border raiuds of dropdown button
      ),
      child: child,
    );
  }

}
