import 'package:fastkart/config.dart';

class QuantityLayout extends StatelessWidget {
  final GestureTapCallback? minusTap;
  final GestureTapCallback? plusTap;
  final String? quantity;
  final Color? discountTextColor;
  final Color? quantityBorderColor;
  final Color? discountBoxColor;
  const QuantityLayout({Key? key,this.minusTap,this.plusTap,this.quantity,this.discountBoxColor,this.discountTextColor,this.quantityBorderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(8),
            horizontal: AppScreenUtil().screenWidth(8)),
        decoration: BoxDecoration(
            color: discountTextColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5)),
            border: Border.all(color: quantityBorderColor!)),
        child: GetBuilder<MyCartListController>(
          builder: (controller) => Row(
            children: [
              InkWell(
                  onTap: minusTap,
                  child: const Icon(
                    Icons.remove,
                    size: 18,
                  )),
              Space(10, 0),
              MyCartFontStyle().mulishtextLayout(
                  text: quantity,
                  fontSize: 14,
                  color: discountBoxColor),
              Space(10, 0),
              InkWell(onTap: plusTap, child: Icon(Icons.add, size: 18)),
            ],
          ),
        ),
      );
    });
  }
}
