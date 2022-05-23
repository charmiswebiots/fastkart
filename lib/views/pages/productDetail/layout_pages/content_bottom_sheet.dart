import '../../../../config.dart';

class QuantityBottomSheet extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? closeTap;
  final GestureTapCallback? applyTap;
  final bool? isQuantity;

  const QuantityBottomSheet(
      {Key? key,
      this.data,
      this.applyTap,
      this.closeTap,
      this.isQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (ctrl) {
      return Directionality(
        textDirection:
        ctrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(15)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                  topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
            ),
            height: MediaQuery.of(context).size.height /
                AppScreenUtil().screenHeight(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailFontStyle().mulishtextLayout(
                    text: ProductDetailFont().selectQuantity,
                    fontWeight: FontWeight.w600,
                    fontSize: ProductDetailFontSize.textSizeSMedium,
                    color: ctrl.appCtrl.appTheme.titleColor),
                const Space(20, 0),
                GridView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(20)),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GridViewLayoutCard(
                      data: data[index],
                      index: index,
                      quantityIndex:
                          isQuantity! ? ctrl.quantityIndex : ctrl.deliveryIndex,
                      onTap: () {
                        if (isQuantity!) {
                          ctrl.quantityIndex = index;
                          ctrl.selectedQuantity = data[index]['title'].toString();
                          ctrl.update();
                        } else {
                          ctrl.deliveryIndex = index;
                          ctrl.selectedDeliveryTime =
                              data[index]['title'].toString();
                          ctrl.update();
                        }
                      },
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 7)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonPopUpButton(
                        onTap: closeTap,
                        containerColor: ctrl.appCtrl.appTheme.popUpColor,
                        borderColor: ctrl.appCtrl.appTheme.primary,
                        textColor: ctrl.appCtrl.appTheme.primary,
                        text: OfferFont().close),
                    CommonPopUpButton(
                        onTap: applyTap,
                        containerColor: ctrl.appCtrl.appTheme.primary,
                        borderColor: ctrl.appCtrl.appTheme.primary,
                        textColor: ctrl.appCtrl.appTheme.whiteColor,
                        text: OfferFont().apply),
                  ],
                )
              ],
            )),
      );
    });
  }
}
