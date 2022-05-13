import 'package:fastkart/utilities/responsive_layout.dart';

import '../../../config.dart';

class DrawerStyle{

  // divider line layout
  Widget dividerLineLayout(
      {double? height, double? horizontalPadding, var color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(horizontalPadding!)),
      child: Divider(
        height: AppScreenUtil().screenHeight(height!),
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


  //contact support text layout
  Widget contactSupport({String? title, double? fontSize, var color}) {
    return DrawerFontStyle().mulishtextLayout(
        text: DrawerFont().contactSupport,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: color);
  }

}