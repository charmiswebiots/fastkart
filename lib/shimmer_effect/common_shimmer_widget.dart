import '../../config.dart';

class CommonShimmerWidget{

  //common shimmer
  Widget commonFullWidthShimmer({var color,double? height,context,Widget? child}){
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5)),
      height: AppScreenUtil().screenHeight(height!),
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }

  // common shimmer
  Widget commonShimmer({var color,double? width,double? height,double borderRadius = 20,Widget? child,var borderColor}){
    return  Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(borderRadius))
      ),
      height: AppScreenUtil().screenHeight(height!),
      width: AppScreenUtil().screenWidth(width!),
      child: child,
    );
  }

  //text and see all shimmer
  Widget commonTextAndSellAll(color){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonShimmerWidget().commonShimmer(
                color: color,
                height: 8,
                borderColor: color,
                width: 80),
            const Space(0, 5),
            CommonShimmerWidget().commonShimmer(
                color: color,
                height: 8,
                borderColor: color,
                width: 60),
          ],
        ),
        CommonShimmerWidget().commonShimmer(
            color: color,
            height: 8,
            borderColor: color,
            width: 60),
      ],
    );
  }

  //common row shimmer layout
  Widget commonRowShimmer(color){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonShimmerWidget().commonShimmer(
            color: color,
            borderRadius: 2,
            borderColor: color,
            width: 80,
            height: 10),
        CommonShimmerWidget().commonShimmer(
            color: color,
            borderRadius: 2,
            borderColor: color,
            width: 60,
            height: 10),
      ],
    );
  }
}