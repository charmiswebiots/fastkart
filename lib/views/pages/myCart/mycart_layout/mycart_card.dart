import '../../../../config.dart';

class MyCartCard extends StatelessWidget {
  final dynamic data;
  final Color? containerBoxColor;
  final Color? dividerColor;
  final Color? titleColor;
  final Color? descriptionColor;
  final Color? discountBoxColor;
  final Color? discountTextColor;
  final Color? quantityBorderColor;
  final GestureTapCallback? minusTap;
  final GestureTapCallback? plusTap;
  final GestureTapCallback? onTap;

  const MyCartCard(
      {Key? key,
      this.data,
      this.titleColor,
      this.containerBoxColor,
      this.descriptionColor,
      this.discountBoxColor,
      this.dividerColor,
      this.discountTextColor,
      this.quantityBorderColor,
      this.minusTap,
      this.plusTap,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppScreenUtil().screenHeight(10),
      ),
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenHeight(15),
          horizontal: AppScreenUtil().screenHeight(10)),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: containerBoxColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppScreenUtil().borderRadius(10)),
            bottomLeft: Radius.circular(AppScreenUtil().borderRadius(10))),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCartStyle()
                .imageLayout(image: data['image'].toString(), onTap: onTap),
            Space(5, 0),
            MyCartStyle().verticalDivider(dividerColor),
            Space(5, 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyCartWidget()
                    .commonText(titleColor: titleColor, text: data['name']),
                Space(0, 2),
                MyCartWidget().commonText(
                    titleColor: descriptionColor, text: data['description']),
                Row(
                  children: [
                    MyCartFontStyle().mulishtextLayout(
                        text: MyCartFont().dollar + data['price'].toString(),
                        fontSize: 12,
                        color: titleColor,
                        fontWeight: FontWeight.w700),
                    MyCartWidget().discountLayout(
                        discountBoxColor: discountBoxColor,
                        child: MyCartFontStyle().mulishtextLayout(
                          text: data['discount'].toString(),
                          fontSize: 10,
                          color: discountTextColor,
                        )),
                    Space(45, 0),
                    QuantityLayout(
                      minusTap: minusTap,
                      plusTap: plusTap,
                      quantity:  data['quantity'].toString(),
                      quantityBorderColor: quantityBorderColor,
                      discountTextColor: discountTextColor,
                      discountBoxColor: discountBoxColor,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
