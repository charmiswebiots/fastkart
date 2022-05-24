import '../../../../config.dart';

class OrderHistoryDaysList extends StatelessWidget {
  const OrderHistoryDaysList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (orderHistoryCtrl) {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: orderHistoryCtrl.appCtrl.appTheme.textBoxColor,
        padding: EdgeInsets.only(
          top: AppScreenUtil().screenHeight(11),
          bottom: AppScreenUtil().screenHeight(11),
        ),
        height: AppScreenUtil().screenHeight(38),
        child: ListView.builder(
          itemCount: AppArray().daysList.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return OrderHistoryStyle().daysListCard(
                data: AppArray().daysList[index],
                index: index,
                selectIndex: orderHistoryCtrl.selectIndex,
                onTap: () => orderHistoryCtrl.selectCategory(
                    index, AppArray().daysList[index]['id']),
                color: orderHistoryCtrl.selectIndex == index
                    ? orderHistoryCtrl.appCtrl.appTheme.primary
                    : orderHistoryCtrl.appCtrl.appTheme.titleColor);
          },
        ),
      );
    });
  }
}
