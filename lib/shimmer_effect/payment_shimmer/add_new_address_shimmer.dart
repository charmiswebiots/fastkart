import '../../config.dart';

class AddNewAddressShimmer extends StatelessWidget {
  const AddNewAddressShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          child: CommonShimmerWidget().commonShimmer(
              borderColor:
              appCtrl.appTheme.lightGray.withOpacity(.5),
              color: appCtrl.appTheme.gray.withOpacity(.2),
              height: 45,
              width: MediaQuery.of(context).size.width,
              borderRadius: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppScreenUtil().screenHeight(10),
                    horizontal: AppScreenUtil().screenWidth(10)),
                child:  Center(
                  child: CommonShimmerWidget().commonShimmer(
                      color:
                      appCtrl.appTheme.darkContentColor,
                      height: 10,
                      borderColor:
                      appCtrl.appTheme.darkContentColor,
                      width:150,
                      borderRadius: 5),
                ),
              )
          ),
        );
      }
    );
  }
}
