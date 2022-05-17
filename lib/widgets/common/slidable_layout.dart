import 'package:flutter_slidable/flutter_slidable.dart';

import '../../config.dart';

class SlidableLayout extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? plusTap;
  final GestureTapCallback? minusTap;
  final bool? isCart;

  const SlidableLayout({Key? key, this.plusTap, this.minusTap, this.data,this.isCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.32,
          motion: const ScrollMotion(),
          children: [
            MyCartStyle().deleteLayout(
                primaryColor: appCtrl.appTheme.primary, onTap: () => {})
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: MyCartCard(
          isCart: isCart,
          onTap: () => Get.toNamed(routeName.productDetail),
          data: data,
          containerBoxColor: appCtrl.appTheme.wishtListBoxColor,
          descriptionColor: appCtrl.appTheme.darkContentColor,
          discountBoxColor: appCtrl.appTheme.primary,
          discountTextColor: appCtrl.appTheme.whiteColor,
          dividerColor: appCtrl.appTheme.contentColor.withOpacity(.5),
          quantityBorderColor: appCtrl.appTheme.lightPrimary,
          titleColor: appCtrl.appTheme.titleColor,
          plusTap: plusTap,
          minusTap: minusTap,
        ),
      );
    });
  }
}
