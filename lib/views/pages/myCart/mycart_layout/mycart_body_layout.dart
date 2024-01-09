import '../../../../config.dart';

class MyCartBodyLayout extends StatelessWidget {
  const MyCartBodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartListController>(
      builder: (wishListCtrl) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                bottom: AppScreenUtil().screenHeight(50)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // wish list layout
                const CartListLayout(),
                //offer ui card
                OfferUICard(
                  onTap: () => wishListCtrl.bottomSheet(
                    data: AppArray().myOfferList[0],
                  ),
                ),
                const Space(0, 5),
                //price detail layout
                const PriceDetailLayout(
                  isOrderDetail: true,
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
