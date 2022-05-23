import '../../../../config.dart';

class OrderAgainRatingLayout extends StatelessWidget {
  final dynamic data;
  final int? index;
  const OrderAgainRatingLayout({Key? key,this.data,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () => Get.toNamed(routeName.addressList),
                child: OrderHistoryStyle().commonTextLayout(
                    text: OrderHistoryFont().orderAgain,
                    color: appCtrl.appTheme.titleColor,
                    fontWeight: FontWeight.w700)),
            index == 0
                ? InkWell(
                onTap: () => Get.toNamed(routeName.addressList),
                child: OrderHistoryStyle().commonTextLayout(
                    text: OrderHistoryFont().rateReviewProduct,
                    color:
                        appCtrl.appTheme.darkContentColor,
                    fontWeight: FontWeight.normal))
                : CommonRatingLayout(
                value: double.parse(data['rating'].toString()),
                onRatingUpdate: (rating) {}),
          ],
        );
      }
    );
  }
}
