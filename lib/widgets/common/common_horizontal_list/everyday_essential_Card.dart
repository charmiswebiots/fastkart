import 'package:fastkart/config.dart';


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
              Space(0, 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeFontStyle()
                            .mulishtextLayout(fontSize: 11, text: data['name']),
                        Space(0, 8),
                        HomeFontStyle().mulishtextLayout(
                            fontSize: 10,
                            color: appCtrl.appTheme.darkContentColor,
                            text: data['description']),
                        Space(0, 8),
                        HomeFontStyle().mulishtextLayout(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: appCtrl.appTheme.titleColor,
                            text: HomeFont().dollar + data['price'].toString()),
                      ],
                    ),
                  ),
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
  }
}
