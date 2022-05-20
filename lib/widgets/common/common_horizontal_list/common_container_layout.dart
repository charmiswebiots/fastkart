import '../../../config.dart';

class CommonContainerLayout extends StatelessWidget {
  final Widget? child;
  final int? index;
  const CommonContainerLayout({Key? key,this.child,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          width: MediaQuery.of(context).size.width / 2.8,
          padding: EdgeInsets.all(AppScreenUtil().size(10)),
          margin: EdgeInsets.only(
              left: AppScreenUtil().size( index == 0 ? 0 : 10),
              right: AppScreenUtil().size(appCtrl.languageVal == "ar" ? 10 :0),
              top: AppScreenUtil().screenHeight(10),
              bottom: AppScreenUtil().screenHeight(20)),
          decoration: BoxDecoration(
              color: appCtrl.appTheme.whiteColor,
              boxShadow: [
                BoxShadow(
                    color: appCtrl.appTheme.contentColor,
                    blurRadius: 1 // Shadow position
                )
              ],
              border: Border.all(color: appCtrl.appTheme.greyBGColor),
              borderRadius:
              BorderRadius.circular(AppScreenUtil().borderRadius(10))),
          child: child,
        );
      }
    );
  }
}
