import '../../config.dart';

class CommonOfferListCard extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? minusTap;
  final GestureTapCallback? plusTap;
  final GestureTapCallback? onTap;

  const CommonOfferListCard(
      {Key? key, this.data, this.plusTap, this.minusTap, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return HomeWidget().commonOfferLayout(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                data['image'].toString(),
                fit: BoxFit.fill,
                height: AppScreenUtil().size(45),
                width: AppScreenUtil().size(50),
              ),
              const Space(5, 0),
              VerticalDivider(
                  color: appCtrl.appTheme.contentColor.withOpacity(.5),
                  width: 5,
                  indent: 5,
                  endIndent: 5,
                  thickness: .5),
              const Space(5, 0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeFontStyle().mulishtextLayout(
                      text: data['name'].toString().tr,
                      fontSize: 13,
                      color: appCtrl.appTheme.titleColor),
                  const Space(0, 4),
                  HomeFontStyle().mulishtextLayout(
                      text: data['description'].toString().tr,
                      fontSize: 13,
                      color: appCtrl.appTheme.darkContentColor),
                  Row(
                    children: [
                      HomeFontStyle().mulishtextLayout(
                          text: HomeFont().dollar + data['price'].toString().tr,
                          fontSize: 12,
                          color: appCtrl.appTheme.titleColor,
                          fontWeight: FontWeight.w700),
                      HomeWidget().discountLayout(
                          color: appCtrl.appTheme.primary,
                          textColor: appCtrl.appTheme.whiteColor,
                          text: data['discount'].toString()),
                      const Space(40, 0),
                      HomeWidget().quantityLayout(
                          color: appCtrl.appTheme.lightPrimary,
                          child: GetBuilder<HomeController>(
                              builder: (controller) => Row(
                                    children: [
                                      InkWell(
                                          onTap: minusTap,
                                          child: Icon(
                                            Icons.remove,
                                            size: AppScreenUtil().size(18),
                                          )),
                                      const Space(10, 0),
                                      HomeFontStyle().mulishtextLayout(
                                          text: data['quantity'].toString(),
                                          fontSize: 14,
                                          color: appCtrl.appTheme.primary),
                                      const Space(10, 0),
                                      InkWell(
                                          onTap: plusTap,
                                          child: Icon(Icons.add,
                                              size: AppScreenUtil().size(18))),
                                    ],
                                  )))
                    ],
                  )
                ],
              ),
            ],
          ),
          context: context,
          onTap: onTap,
          color: appCtrl.appTheme.whiteColor);
    });
  }
}
