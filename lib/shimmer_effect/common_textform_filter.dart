import '../config.dart';

class CommonTextFormAndFilter extends StatelessWidget {
  const CommonTextFormAndFilter({Key? key}) : super(key: key);

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
              CommonShimmerWidget().commonShimmer(
                  color: appCtrl.appTheme.lightGray.withOpacity(.4),
                  borderColor:
                  appCtrl.appTheme.lightGray.withOpacity(.4),
                  width: 250,
                  borderRadius: 5,
                  height: 45),
              const Space(10, 0),
              CommonShimmerWidget().commonShimmer(
                  color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  borderRadius: 2,
                  borderColor:
                  appCtrl.appTheme.lightGray.withOpacity(.5),
                  height: 10,
                  width: 70),

            ],
          ),
        );
      }
    );
  }
}
