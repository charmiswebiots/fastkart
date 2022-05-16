import 'package:fastkart/config.dart';

class ItemListLayout extends StatelessWidget {
  const ItemListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth( 15)),
          height: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 170 :220),
          child: ListView.builder(
            itemCount: AppArray().orderDetailList.length,
            itemBuilder: (context, index) {
              return ItemListCard(
                data: AppArray().orderDetailList[index],
                quantityLayoutColor: appCtrl.appTheme.primary,
                quantityTextColor: appCtrl.appTheme.white,
                titleColor: appCtrl.appTheme.titleColor,
                darkContentColor: appCtrl.appTheme.darkContentColor,
                contentColor: appCtrl.appTheme.contentColor,
                index: index,
                lastIndex:
                AppArray().orderDetailList.length - 1,
              );
            },
          ),
        );
      }
    );
  }
}
