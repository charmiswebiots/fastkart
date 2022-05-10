import 'package:fastkart/controllers/productdetail_controller.dart';
import 'package:fastkart/views/pages/productDetail/gridviewLayout.dart';
import 'package:fastkart/views/pages/productDetail/util/productDetail_constants.dart';
import 'package:fastkart/views/pages/productDetail/util/productDetail_fontstyle.dart';
import 'package:fastkart/views/pages/productDetail/util/productDetail_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class QuantityBottomSheet extends StatelessWidget {
  var data;
  var primaryColor;
  var containerColor;
  var borderColor;
  var textColor;
  var iconColor;
  var closeTextColor;
  var cancelTextColor;
  var closeContainerColor;
  GestureTapCallback? closeTap;
  GestureTapCallback? applyTap;
  bool? isQuantity;

  QuantityBottomSheet(
      {Key? key,
        this.data,
      this.primaryColor,
      this.containerColor,
      this.borderColor,
      this.textColor,
      this.iconColor,
      this.cancelTextColor,
      this.closeTextColor,this.closeContainerColor,this.applyTap,this.closeTap,this.isQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (ctrl) {
      return Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15),
              vertical: AppScreenUtil().screenHeight(15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
          ),
          height: MediaQuery.of(context).size.height / AppScreenUtil().screenHeight(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDetailFontStyle().mulishtextLayout(
                  text: ProductDetailFont().selectQuantity,
                  fontWeight: FontWeight.w600,
                  fontSize: ProductDetailFontSize.textSizeSMedium,
                  color: textColor),
              Space(20, 0),
              GridView.builder(
                padding: EdgeInsets.symmetric(
                    vertical: AppScreenUtil().screenHeight(20)),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GridViewLayoutCard(
                    data: data[index],
                    iconColor: iconColor,
                    index: index,
                    quantityIndex: isQuantity! ? ctrl.quantityIndex : ctrl.deliveryIndex,
                    containerColor: containerColor,
                    borderColor: borderColor,
                    textColor: textColor,
                    primaryColor: primaryColor,
                    onTap: () {
                      if(isQuantity!) {
                        ctrl.quantityIndex = index;
                        ctrl.selectedQuantity =
                            data[index]['title'].toString();
                        ctrl.update();
                      }else{
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
                  ProductDetailWidget().commonButtonWidget(
                      containerColor: closeContainerColor,
                      context: context,
                      borderColor: primaryColor,
                      onTap: closeTap,
                      textColor: primaryColor,
                      text: ProductDetailFont().close),
                  ProductDetailWidget().commonButtonWidget(
                      containerColor: primaryColor,
                      context: context,
                      onTap: applyTap,
                      borderColor: primaryColor,
                      textColor: cancelTextColor,
                      text: ProductDetailFont().apply),
                ],
              )
            ],
          ));
    });
  }
}
