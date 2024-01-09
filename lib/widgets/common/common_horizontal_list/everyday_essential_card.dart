import 'package:fastkart/config.dart';
import 'package:fastkart/widgets/common/common_horizontal_list/product_data_layout.dart';

class EveryDayEssentialCard extends StatelessWidget {
  final int? index;
  final dynamic data;

  const EveryDayEssentialCard({
    Key? key,
    this.index,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommonController>(builder: (commonCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return InkWell(
          onTap: () => Get.toNamed(routeName.productDetail),
          child: CommonContainerLayout(
            index: index,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      iconAssets.heart,
                      color: appCtrl.appTheme.titleColor,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          AppScreenUtil().screenWidth(8),
                          AppScreenUtil().screenHeight(4),
                          AppScreenUtil().screenWidth(8),
                          AppScreenUtil().screenWidth(8)),
                      child: Image.asset(
                        data['image'].toString(),
                        height: AppScreenUtil().screenHeight(50),
                        width: AppScreenUtil().screenWidth(100),
                      ),
                    ),
                  ],
                ),
                const Space(0, 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ProductData(data: data,),
                    Container(
                      padding: EdgeInsets.all(AppScreenUtil().size(5)),
                      decoration: BoxDecoration(
                          color: appCtrl.appTheme.primary,
                          borderRadius: BorderRadius.circular(
                              AppScreenUtil().borderRadius(5))),
                      child: Icon(
                        Icons.add,
                        color: appCtrl.appTheme.whiteColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
