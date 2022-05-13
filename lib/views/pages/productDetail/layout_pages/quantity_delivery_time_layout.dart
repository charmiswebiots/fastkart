
import '../../../../config.dart';

class QuantityDeliverTimeLayout extends StatelessWidget {
  const QuantityDeliverTimeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productDetailCtrl) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SelectionLayout(
                  text: productDetailCtrl.selectedQuantity,
                  onTap: () =>
                      productDetailCtrl.commonBottomSheet(context: context,index: 0)),
            ),
            Space(10, 0),
            Expanded(
              child: SelectionLayout(
                  text: productDetailCtrl.selectedDeliveryTime,
                  onTap: () =>
                      productDetailCtrl.commonBottomSheet(context: context,index: 1)),
            ),
          ],
        ),
      );
    });
  }
}
