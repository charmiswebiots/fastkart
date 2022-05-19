import 'package:fastkart/config.dart';

class PaymentShimmerWidget {
  //common row card name widget
  Widget commonCardNameWidget(color,iconColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonShimmerWidget().commonShimmer(
              color: color,
              borderRadius: 2,
              height: 10,
              borderColor: color,
              width: 100),
          CommonShimmerWidget().commonShimmer(
              color: color,
              borderRadius: 50,
              height: 24,
              borderColor: color,
              width: 26,child: Icon(Icons.circle,color: iconColor,size: AppScreenUtil().size(16),))
        ],
      ),
    );
  }

  //card layout
  Widget cardLayout(color,iconColor){
    return Padding(
      padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(10)),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const  AddNewAddressShimmer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15),),
            height: AppScreenUtil().screenHeight(25),
            width: AppScreenUtil().screenWidth(25),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(topRight: Radius.circular(AppScreenUtil().borderRadius(5)),bottomLeft:Radius.circular(AppScreenUtil().borderRadius(5)) )
            ),
            child: Center(child: Icon(Icons.check,color: iconColor,size: AppScreenUtil().size(18),)),
          )
        ],
      ),
    );
  }

  //price detail layout
  Widget priceDetailLayout(color,context){
    return  Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15)),
      child: CommonShimmerWidget().commonShimmer(
          color: color,
          borderColor: color,
          borderRadius: 10,
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(10)),
            child: const PriceDetailShimmer(),
          )),
    );
  }
}
