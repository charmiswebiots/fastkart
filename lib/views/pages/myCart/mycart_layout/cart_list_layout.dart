
import 'package:fastkart/widgets/common/slidable_layout.dart';
import '../../../../config.dart';

class CartListLayout extends StatelessWidget {
  const CartListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GetBuilder<MyCartListController>(
          builder: (wishListCtrl) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  left: AppScreenUtil().screenHeight(15),
                  right: AppScreenUtil().screenHeight(15)),
              child: ListView.builder(
                itemCount: wishListCtrl.offerList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return SlidableLayout(
                    data: wishListCtrl.offerList[index],
                    plusTap:()=>  wishListCtrl.plusTap(index),
                    minusTap:()=>  wishListCtrl.minusTap(index),
                  );
                },
              ),
            );
          }
        );
      }
    );
  }
}
