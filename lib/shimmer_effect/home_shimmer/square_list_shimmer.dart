import '../../config.dart';

class SquareListShimmer extends StatelessWidget {
  const SquareListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenHeight(15),
            vertical: AppScreenUtil().screenHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonShimmerWidget().commonShimmer(
                color: appCtrl.appTheme.gray.withOpacity(.5),
                height: 10,
                borderColor: appCtrl.appTheme.gray.withOpacity(.5),
                width: 100),
            const Space(0, 15),
            SizedBox(
              height: AppScreenUtil().screenHeight(50),
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(
                      right: AppScreenUtil().size(15)),
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().size(12),
                      horizontal: AppScreenUtil().size(12)),
                  decoration: BoxDecoration(
                      color: appCtrl.appTheme.gray.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10)),
                  height: AppScreenUtil().screenHeight(50),
                  width: AppScreenUtil().screenHeight(50),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
