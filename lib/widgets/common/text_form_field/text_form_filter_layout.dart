import '../../../config.dart';

class TextFormFilterLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  const TextFormFilterLayout({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.only(
              left: AppScreenUtil().screenHeight(
                  appCtrl.languageVal ==
                      "ar"
                      ? 15
                      : 0),
              right: AppScreenUtil().screenHeight(
                 appCtrl.languageVal !=
                      "ar"
                      ? 15
                      : 0)),
          child: Row(
            children: [
              Expanded(
                child: CommonSearchTextForm(
                  text: OrderHistoryFont().searchProduct,
                  borderColor: appCtrl.appTheme.primary
                      .withOpacity(.3),
                  hintColor: appCtrl.appTheme.contentColor,
                  fillcolor: appCtrl.appTheme.textBoxColor,
                  titleColor: appCtrl.appTheme.titleColor,
                ),
              ),
              InkWell(
                onTap: onTap,
                child: OrderHistoryFontStyle()
                    .mulishtextLayout(
                    text: OrderHistoryFont().filter,
                    fontSize: 16,
                    color: appCtrl.appTheme.primary,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      }
    );
  }
}
