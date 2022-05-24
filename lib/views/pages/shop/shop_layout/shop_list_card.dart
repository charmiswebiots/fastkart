import '../../../../config.dart';

class ShopListCard extends StatelessWidget {
  final dynamic data;
  final Color? dividerColor;
  final Color? titleColor;
  final Color? discountTextColor;
  final Color? quantityBorderColor;
  final int? index;
  final GestureTapCallback? minusTap;
  final GestureTapCallback? plusTap;
  final GestureTapCallback? onTap;

  const ShopListCard({
    Key? key,
    this.data,
    this.titleColor,
    this.dividerColor,
    this.discountTextColor,
    this.quantityBorderColor,
    this.minusTap,
    this.plusTap,
    this.index,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index == 3  ?  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding:EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(5)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(data['image'],height: AppScreenUtil().screenHeight(120),fit: BoxFit.fill,),
              ShopFontStyle().quicksandtextLayout(text: data['name'],fontWeight: FontWeight.w500,fontSize: 16,)
            ],
          ),
        );
      }
    ) :GetBuilder<ShopController>(
        builder: (shopCtrl) {
        return InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
            child: CommonOfferListCard(
              data: data,
              isColor: true,
              plusTap: plusTap,
              minusTap:minusTap,
            ),
          ),
        );
      }
    );
  }
}
