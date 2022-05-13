import 'package:fastkart/config.dart';

class CouponCard extends StatelessWidget {
  final int? index;
  final Color? primaryColor;
  final Color? titleColor;
  final Color? decriptionColor;
  final CouponModel? couponModel;
  final bool? isTheme;

  const CouponCard(
      {Key? key,
      this.index,
      this.primaryColor,
      this.titleColor,
      this.couponModel,
      this.decriptionColor,
      this.isTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: index == 0 ? 0 : AppScreenUtil().screenWidth(12),
          right: AppScreenUtil().screenWidth(12),
          top: AppScreenUtil().screenWidth(15)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            isTheme! ? couponModel!.themeBG : couponModel!.BG,
            height: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 130 : 150),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(
                     horizontal: AppScreenUtil().screenWidth(10),),
                child: Image.asset(
                  couponModel!.image,
                  width: AppScreenUtil().screenWidth(100),
                  height: AppScreenUtil().screenHeight(40),
                  fit: BoxFit.fill,
                ),
              ),
              Space(0, 10),
              HomeFontStyle().mulishtextLayout(
                  text: couponModel!.title,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: titleColor),
              Space(0, 5),
              HomeFontStyle().mulishtextLayout(
                  text: couponModel!.upToText,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: decriptionColor)
            ],
          ),
        ],
      ),
    );
  }
}
