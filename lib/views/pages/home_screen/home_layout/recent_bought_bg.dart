import '../../../../config.dart';

class RecentBoughtBg extends StatelessWidget {
  const RecentBoughtBg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
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
        );
      }
    );
  }
}
