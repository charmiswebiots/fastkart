import 'package:fastkart/utilities/responsive_layout.dart';

import '../../../../config.dart';

class YourAccountStyle{


  // divider line layout
  Widget dividerLineLayout(
      { var color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(10)),
      child: Divider(
        height: AppScreenUtil().screenHeight(48),
        color: color,
        thickness: 1,
      ),
    );
  }

  //forward arrow icon container
  Widget forwardArrow({var color, context}) {
    return Container(
        padding: EdgeInsets.all(AppScreenUtil().screenWidth(5)),
        decoration: BoxDecoration(
            color: color,
            borderRadius:
            BorderRadius.circular(AppScreenUtil().borderRadius(50))),
        child: Icon(Icons.arrow_forward_ios_outlined,
            size: AppScreenUtil()
                .size(ResponsiveWidget.isLargeScreen(context) ? 12 : 10)));
  }

  //common Image Layout
  Widget commonImageLayout({String? image, double? height, var iconColor}) {
    return image == 'assets/icons/language.png'
        ? Image.asset(image!, height: AppScreenUtil().screenHeight(height!))
        : Image.asset(
      image!,
      height: AppScreenUtil().screenHeight(height!),
      color: iconColor,
    );
  }
}