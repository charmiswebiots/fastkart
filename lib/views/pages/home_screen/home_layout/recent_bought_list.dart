import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/home_screen/home_layout/recent_bought_bg.dart';

class RecentBoughtList extends StatelessWidget {
  final dynamic list;
  const RecentBoughtList({
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
            const RecentBoughtBg(),
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
                  const  Space(0, 20),
                  SizedBox(
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
