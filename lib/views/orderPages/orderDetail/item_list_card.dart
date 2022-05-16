
import '../../../config.dart';

class ItemListCard extends StatelessWidget {
  final dynamic data;
  final Color? quantityLayoutColor;
  final Color? quantityTextColor;
  final Color? titleColor;
  final Color? darkContentColor;
  final Color? contentColor;
  final int? index;
  final int? lastIndex;

  const ItemListCard(
      {Key? key,
      this.data,
      this.quantityLayoutColor,
      this.quantityTextColor,
      this.titleColor,
      this.contentColor,
      this.darkContentColor,
      this.index,
      this.lastIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  OrderDetailStyle().quantityLayout(
                    quantityLayoutColor: quantityLayoutColor,
                    child: OrderDetailFontStyle().mulishtextLayout(
                        text: data['quantity'].toString(),
                        color: quantityTextColor,
                        fontSize: OrderDetailFontSize.textSizeSmall),
                  ),
                  const Space(10, 0),
                  OrderDetailWidget().multiplyIconLayout(titleColor),
                  const Space(10, 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailFontStyle().mulishtextLayout(
                          text: data['name'].toString(),
                          color: titleColor,
                          fontSize: OrderDetailFontSize.textSizeSmall),
                      const Space(0, 5),
                      OrderDetailFontStyle().mulishtextLayout(
                          text: data['gram'].toString(),
                          color: darkContentColor,
                          fontSize: OrderDetailFontSize.textSizeSmall),
                    ],
                  )
                ],
              ),
              OrderDetailFontStyle().mulishtextLayout(
                  text: data['price'].toString(),
                  color: titleColor,
                  fontSize: OrderDetailFontSize.textSizeSMedium),
            ],
          ),
          const Space(0, 8),
          if (index != lastIndex)
            Divider(
              color: contentColor,
              thickness: .5,
            )
        ],
      ),
    );
  }
}
