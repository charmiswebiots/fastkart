import '../../config.dart';

class CommonAppBarShimmer extends StatelessWidget {
  const CommonAppBarShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.crop_square,
                    color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  ),
                  CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor:
                      appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderRadius: 10,
                      width: 100,
                      height: 10),
                ],
              ),
              Icon(
                Icons.circle,
                color: appCtrl.appTheme.lightGray.withOpacity(.5),
              ),
            ],
          ),
        );
      }
    );
  }
}
