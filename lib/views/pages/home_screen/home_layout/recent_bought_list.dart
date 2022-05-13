import 'package:fastkart/config.dart';

class RecentBoughtList extends StatelessWidget {
  var list;
  RecentBoughtList({
    Key? key,
    this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: appCtrl.appTheme.whiteColor,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: AppScreenUtil().screenHeight(15),
                  right: AppScreenUtil().screenHeight(20)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppScreenUtil().borderRadius(15)),
                    bottomLeft:
                        Radius.circular(AppScreenUtil().borderRadius(15)),
                    bottomRight:
                        Radius.circular(AppScreenUtil().borderRadius(15)),
                    topRight: Radius.circular(AppScreenUtil().borderRadius(40)),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(AppScreenUtil().borderRadius(15)),
                      bottomLeft:
                          Radius.circular(AppScreenUtil().borderRadius(15)),
                      bottomRight:
                          Radius.circular(AppScreenUtil().borderRadius(15)),
                      topRight:
                          Radius.circular(AppScreenUtil().borderRadius(35)),
                    ),
                    child: Image.asset(
                      appCtrl.isTheme
                          ? imageAssets.themeRecentBoughtBG
                          : imageAssets.recentBoughtBG,
                      fit: BoxFit.fill,
                      height: AppScreenUtil().screenHeight(130),
                      width: MediaQuery.of(context).size.width,
                    )),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  left: AppScreenUtil().screenWidth(30),
                  right: AppScreenUtil().screenWidth(20),
                  top: AppScreenUtil().screenHeight(18),
                  bottom: AppScreenUtil().screenHeight(40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //recent bought widget
                  HomeStyle().recentlyBought(
                      text: HomeFont().recentBought, color: appCtrl.appTheme.titleColor),
                  Space(0, 20),
                  Container(
                    height: AppScreenUtil().screenHeight(50),
                    child: ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.toNamed(routeName.productDetail),
                          child: Container(
                            margin: EdgeInsets.only(
                                right: AppScreenUtil().size(15)),
                            padding: EdgeInsets.symmetric(
                                vertical: AppScreenUtil().size(12),
                                horizontal: AppScreenUtil().size(12)),
                            decoration: BoxDecoration(
                                color: appCtrl.appTheme.whiteColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              list[index]['image'].toString(),
                              fit: BoxFit.fill,
                              height: AppScreenUtil().size(30),
                              width: AppScreenUtil().size(30),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            /* Positioned(right: 15, child: Image.asset(imageAssets.corner))*/
          ],
        ),
      );
    });
  }
}
