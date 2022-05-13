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
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(10),
              horizontal: AppScreenUtil().screenHeight(15),

            ),
            padding: EdgeInsets.symmetric(
                vertical: AppScreenUtil().screenHeight(15),
                horizontal: AppScreenUtil().screenHeight(10)),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: shopCtrl
                  .appCtrl.appTheme.wishtListBoxColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppScreenUtil().borderRadius(10)),
                  bottomLeft: Radius.circular(AppScreenUtil().borderRadius(10))),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    data['image'].toString(),
                    fit: BoxFit.fill,
                    height: AppScreenUtil().screenHeight(45),
                    width: AppScreenUtil().screenWidth(50),
                  ),
                  Space(5, 0),
                  VerticalDivider(
                    color: dividerColor,
                    width: 5,
                    indent: 10,
                    endIndent: 10,
                    thickness: .5,
                  ),
                  Space(5, 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShopFontStyle().mulishtextLayout(
                          text: data['name'], fontSize: 13, color: titleColor),
                      Space(0, 2),
                      ShopFontStyle().mulishtextLayout(
                          text: data['description'],
                          fontSize: 13,
                          color: shopCtrl
                              .appCtrl.appTheme.darkContentColor),
                      Row(
                        children: [
                          ShopFontStyle().mulishtextLayout(
                              text: ShopFont().dollar + data['price'].toString(),
                              fontSize: 12,
                              color: titleColor,
                              fontWeight: FontWeight.w700),
                          Container(
                            decoration: BoxDecoration(
                                color: shopCtrl.appCtrl.appTheme.primary,
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.only(
                                left: AppScreenUtil().screenHeight(5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(10),
                                vertical: AppScreenUtil().screenHeight(3)),
                            child: ShopFontStyle().mulishtextLayout(
                              text: data['discount'].toString(),
                              fontSize: 10,
                              color: discountTextColor,
                            ),
                          ),
                          Space(45, 0),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppScreenUtil().screenHeight(8),
                                horizontal: AppScreenUtil().screenWidth(8)),
                            decoration: BoxDecoration(
                                color: discountTextColor,
                                borderRadius: BorderRadius.circular(
                                    AppScreenUtil().borderRadius(5)),
                                border: Border.all(color: quantityBorderColor!)),
                            child: GetBuilder<ShopController>(
                              builder: (controller) => Row(
                                children: [
                                  InkWell(
                                      onTap: minusTap,
                                      child: const Icon(
                                        Icons.remove,
                                        size: 18,
                                      )),
                                  Space(10, 0),
                                  Text(data['quantity'].toString()),
                                  Space(10, 0),
                                  InkWell(
                                      onTap: plusTap,
                                      child: Icon(Icons.add, size: 18)),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
