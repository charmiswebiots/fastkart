import 'package:fastkart/config.dart';

class DashboardShimmerWidget{

  // icon shimmer
  Widget iconShimmer(icon,color){
    return Icon(icon,color: color,);
  }

  // text shimmer
  Widget textShimmer({var color,double? width,double? height}){
    return  Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(20))
      ),
      height: AppScreenUtil().screenHeight(height!),
      width: AppScreenUtil().screenWidth(width!),
    );
  }
}