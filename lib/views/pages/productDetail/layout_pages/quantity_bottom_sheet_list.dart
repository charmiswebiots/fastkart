import '../../../../config.dart';

class QuantityBottomSheetList extends StatelessWidget {
  final dynamic data;
  final bool? isQuantity;
  const QuantityBottomSheetList({Key? key,this.data,this.isQuantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<ProductDetailController>(builder: (ctrl) {
        return GridView.builder(
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
                  ctrl.selectedQuantity =
                      data[index]['title'].toString();
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
        );
      }
    );
  }
}
