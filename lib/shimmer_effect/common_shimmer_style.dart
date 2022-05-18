import 'package:fastkart/config.dart';

class CommonShimmerStyle {
  //shop category
  Widget shopCategory({var color}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonShimmerWidget().commonShimmer(
            color: color,
            borderColor: color,
            height: AppScreenUtil().screenHeight(2),
            width: AppScreenUtil().screenWidth(70),
          ),
          CommonShimmerWidget().commonShimmer(
            color: color,
            borderColor: color,
            height: AppScreenUtil().screenHeight(8),
            width: AppScreenUtil().screenWidth(80),
          ),
          CommonShimmerWidget().commonShimmer(
            color: color,
            borderColor: color,
            height: AppScreenUtil().screenHeight(2),
            width: AppScreenUtil().screenWidth(70),
          )
        ],
      ),
    );
  }

  //didn't find and browse category Layout
  Widget notFindAndBrowseCategory(color, textColor) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonShimmerWidget().commonShimmer(
              color: color,
              borderColor: color,
              height: 8,
              width: 200,
              borderRadius: 10),
          const Space(0, 20),
          CommonShimmerWidget().commonShimmer(
              color: color,
              borderColor: color,
              height: 40,
              width: 150,
              borderRadius: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppScreenUtil().screenWidth(15),
                    vertical: AppScreenUtil().screenHeight(15)),
                child: CommonShimmerWidget().commonShimmer(
                    color: textColor,
                    borderColor: textColor,
                    height: 8,
                    width: 100,
                    borderRadius: 10),
              )),
        ],
      ),
    );
  }

  //common button shimmer
  Widget commonButton({context, var color, var textColor}) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(10)),
      child:Container(
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))
        ),
        child:  Divider(thickness: 10,color: textColor,endIndent: 15,indent: 15,),
      ),
    );
  }
}
