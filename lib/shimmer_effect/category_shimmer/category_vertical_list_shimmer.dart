import 'package:fastkart/config.dart';

class CategoryVerticalListShimmer extends StatelessWidget {
  const CategoryVerticalListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        width: AppScreenUtil().screenWidth(110),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppScreenUtil().borderRadius(5)),
                bottomRight: Radius.circular(
                  AppScreenUtil().borderRadius(5),
                ))),
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppArray().categoryData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(8),
                      horizontal: AppScreenUtil().screenWidth(15)),
                  height: AppScreenUtil().screenHeight(100),
                  width: AppScreenUtil().screenWidth(110),
                  decoration: BoxDecoration(
                    color: appCtrl.appTheme.lightGray.withOpacity(.5),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                            AppScreenUtil().borderRadius(index == 0 ? 5 : 0)),
                        bottomRight: Radius.circular(AppScreenUtil()
                            .borderRadius(
                                index == AppArray().categoryData.length - 1
                                    ? 5
                                    : 0))),
                  ),
                  child: Column(
                    children: [
                      const Space(0, 10),
                      CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.gray.withOpacity(.5),
                          borderColor: appCtrl.appTheme.gray.withOpacity(.5),
                          height: 50,
                          width: 50,
                          borderRadius: 10),
                      const Space(0, 5),
                      CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.gray.withOpacity(.5),
                          borderColor: appCtrl.appTheme.gray.withOpacity(.5),
                          height: 10,
                          width: 100,
                          borderRadius: 10)
                    ],
                  ),
                ),
                if (index != AppArray().categoryData.length - 1)
                  Divider(
                    color: appCtrl.appTheme.darkContentColor,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  )
              ],
            );
          },
        ),
      );
    });
  }
}
