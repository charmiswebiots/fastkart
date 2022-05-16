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
      return InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(10),
          ),
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(15),
              horizontal: AppScreenUtil().screenHeight(15)),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: appCtrl.appTheme.whiteColor,
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(10))),
          child: IntrinsicHeight(
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
                    indent: 10,
                    endIndent: 10,
                    thickness: .5),
                const Space(5, 0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeFontStyle().mulishtextLayout(
                        text: data['name'],
                        fontSize: 13,
                        color: appCtrl.appTheme.titleColor),
                    const Space(0, 4),
                    HomeFontStyle().mulishtextLayout(
                        text: data['description'],
                        fontSize: 13,
                        color: appCtrl.appTheme.darkContentColor),
                    Row(
                      children: [
                        HomeFontStyle().mulishtextLayout(
                            text: HomeFont().dollar + data['price'].toString(),
                            fontSize: 12,
                            color: appCtrl.appTheme.titleColor,
                            fontWeight: FontWeight.w700),
                        Container(
                          decoration: BoxDecoration(
                              color: appCtrl.appTheme.primary,
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.only(
                              left: AppScreenUtil().screenHeight(5)),
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(10),
                              vertical: AppScreenUtil().screenHeight(3)),
                          child: HomeFontStyle().mulishtextLayout(
                            text: data['discount'].toString(),
                            fontSize: 10,
                            color: appCtrl.appTheme.whiteColor,
                          ),
                        ),
                        const Space(40, 0),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: AppScreenUtil().screenHeight(8),
                              horizontal: AppScreenUtil().screenWidth(8)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppScreenUtil().borderRadius(5)),
                              border: Border.all(
                                  color: appCtrl.appTheme.lightPrimary)),
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

                                const  Space(10, 0),
                                InkWell(
                                    onTap: plusTap,
                                    child: Icon(Icons.add,
                                        size: AppScreenUtil().size(18))),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
