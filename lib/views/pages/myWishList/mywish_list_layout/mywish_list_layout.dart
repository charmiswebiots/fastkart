
import 'package:fastkart/widgets/common/slidable_layout.dart';

import '../../../../config.dart';

class MyWishListLayout extends StatelessWidget {
  const MyWishListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyWishListController>(
      builder: (wishListCtrl) {
        return Container(
          height: MediaQuery.of(context).size.height,
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
                plusTap: ()=> wishListCtrl.plusTap(index),
                minusTap: ()=> wishListCtrl.minusTap(index),
              );
            },
          ),
        );
      }
    );
  }
}
