import '../../../../config.dart';

class TimeFilterList extends StatelessWidget {
  const TimeFilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(
      builder: (orderHistoryCtrl) {
        return GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: AppArray().timefilterList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                orderHistoryCtrl.filterIndex = index;
                orderHistoryCtrl.update();
              },
              child: Container(
                height: AppScreenUtil().screenHeight(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == orderHistoryCtrl.filterIndex
                      ? orderHistoryCtrl.appCtrl.appTheme.primary
                      : orderHistoryCtrl.appCtrl.appTheme.wishtListBoxColor,
                  borderRadius: BorderRadius.circular(
                      AppScreenUtil().borderRadius(5)),
                  border: Border.all(
                      color: orderHistoryCtrl.appCtrl.isTheme
                          ? orderHistoryCtrl.appCtrl.appTheme.gray
                          : orderHistoryCtrl.appCtrl.appTheme.primary.withOpacity(.2),
                      width: .5), //border of dropdown button
                ),
                child: OrderHistoryFontStyle().mulishtextLayout(
                    text: AppArray()
                        .timefilterList[index]['title']
                        .toString(),
                    fontSize: OrderHistoryFontSize.textSizeSMedium,
                    color: index == orderHistoryCtrl.filterIndex
                        ? orderHistoryCtrl.appCtrl.appTheme.white
                        : orderHistoryCtrl.appCtrl.appTheme.darkContentColor),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 7),
          ),
        );
      }
    );
  }
}
