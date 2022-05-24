import 'package:fastkart/views/pages/productDetail/layout_pages/quantity_bottom_sheet_list.dart';

import '../../../../config.dart';

class QuantityBottomSheet extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? closeTap;
  final GestureTapCallback? applyTap;
  final bool? isQuantity;

  const QuantityBottomSheet(
      {Key? key, this.data, this.applyTap, this.closeTap, this.isQuantity})
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
                QuantityBottomSheetList(
                  data: data,
                  isQuantity: isQuantity,
                ),
                CommonCancelCloseApplyButton(
                  button2: OfferFont().apply,
                  button1: OfferFont().close,
                )
              ],
            )),
      );
    });
  }
}
