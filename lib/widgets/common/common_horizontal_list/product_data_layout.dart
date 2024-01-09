import '../../../config.dart';

class ProductData extends StatelessWidget {
  final dynamic data;
  const ProductData({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeFontStyle().mulishtextLayout(
                  fontSize: 11,
                  text: data['name'].toString().tr,
                  textAlign:
                  appCtrl.languageVal == "ar" || appCtrl.isRTL
                      ? TextAlign.right
                      : TextAlign.left,
                  overflow: TextOverflow.ellipsis),
              const Space(0, 8),
              HomeFontStyle().mulishtextLayout(
                  fontSize: 10,
                  color: appCtrl.appTheme.darkContentColor,
                  text: data['description']),
              const Space(0, 8),
              HomeFontStyle().mulishtextLayout(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: appCtrl.appTheme.titleColor,
                text: appCtrl.commonController.priceSymbol +
                    (double.parse(
                        (appCtrl.commonController.rateValue *
                            double.parse(data['price']))
                            .toStringAsFixed(2)))
                        .toString(),
              )
            ],
          ),
        );
      }
    );
  }
}
