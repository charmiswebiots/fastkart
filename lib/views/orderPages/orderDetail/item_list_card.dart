import '../../../config.dart';

class ItemListCard extends StatelessWidget {
  final dynamic data;
  final int? index;
  final int? lastIndex;

  const ItemListCard({Key? key, this.data, this.index, this.lastIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
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
                      quantityLayoutColor: appCtrl.appTheme.primary,
                      child: OrderDetailFontStyle().mulishtextLayout(
                          text: data['quantity'].toString(),
                          color: appCtrl.appTheme.white,
                          fontSize: OrderDetailFontSize.textSizeSmall),
                    ),
                    const Space(10, 0),
                    OrderDetailStyle()
                        .multiplyIconLayout(appCtrl.appTheme.titleColor),
                    const Space(10, 0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderDetailFontStyle().mulishtextLayout(
                            text: data['name'].toString(),
                            color: appCtrl.appTheme.titleColor,
                            fontSize: OrderDetailFontSize.textSizeSmall),
                        const Space(0, 5),
                        OrderDetailFontStyle().mulishtextLayout(
                            text: data['gram'].toString(),
                            color: appCtrl.appTheme.darkContentColor,
                            fontSize: OrderDetailFontSize.textSizeSmall)
                      ],
                    )
                  ],
                ),
                OrderDetailFontStyle().mulishtextLayout(
                    text: data['price'].toString(),
                    color: appCtrl.appTheme.titleColor,
                    fontSize: OrderDetailFontSize.textSizeSMedium)
              ],
            ),
            const Space(0, 8),
            if (index != lastIndex)
              Divider(color: appCtrl.appTheme.contentColor, thickness: .5)
          ],
        ),
      );
    });
  }
}
