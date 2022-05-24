import '../../../../config.dart';

class OrderTrackAddressLayout extends StatelessWidget {
  const OrderTrackAddressLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderTrackController>(
      builder: (orderTrackCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15)),
          child: ListView.builder(
            itemCount: orderTrackCtrl.addressList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AddressLayout(),
                if (index != orderTrackCtrl.addressList.length - 1)
                  OrderTrackStyle().verticalLineDivider(),
              ],
            ),
          ),
        );
      }
    );
  }
}
