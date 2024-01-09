import 'package:fastkart/config.dart';

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
                  Directionality(
                    textDirection: appCtrl.languageVal == "ar" ? TextDirection.rtl : TextDirection.ltr,
                    child: HomeStyle().recentlyBought(
                        text: HomeFont().recentBought,
                        color: appCtrl.appTheme.titleColor),
                  ),
                  const Space(0, 20),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(50),
                    child: ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return RecentBoughtCard(
                          index: index,
                          list: list[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      );
    });
  }
}
