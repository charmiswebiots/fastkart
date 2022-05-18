import 'package:fastkart/config.dart';

class GridViewShimmer extends StatelessWidget {
  const GridViewShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) => SizedBox(
        width: MediaQuery.of(context).size.width /
            AppScreenUtil().screenWidth(
                AppScreenUtil().screenActualWidth() > 375 ? 1.6 : 1.7),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CommonShimmerWidget().commonShimmer(
                    color: appCtrl.appTheme.lightGray.withOpacity(.5),
                    borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                    borderRadius: 10,
                    height: 50,
                    width: 60,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(10),
                          vertical: AppScreenUtil().screenHeight(10)),
                      child: CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.darkContentColor,
                          borderColor:
                              appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderRadius: 5,
                          height: 25,
                          width: 50),
                    )),
                const Space(0, 5),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppScreenUtil().screenWidth(10),
                  ),
                  child: CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.darkContentColor,
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderRadius: 10,
                      height: 10,
                      width: 30),
                ),
              ],
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / (1.7)),
          ),
        ),
      ),
    );
  }
}
