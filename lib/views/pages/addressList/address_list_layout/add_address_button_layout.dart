import '../../../../config.dart';

class AddAddressButtonLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  const AddAddressButtonLayout({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return InkWell(
          onTap: onTap,
          child: Container(
            margin:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
            padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: appCtrl.appTheme.contentColor),
                borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: appCtrl.appTheme.darkContentColor),
                AddressListFontStyle().mulishtextLayout(
                    text: AddressListFont().addAddress,
                    fontSize: AddressListFontSize.textSizeSMedium,
                    color: appCtrl.appTheme.darkContentColor),
              ],
            ),
          ),
        );
      }
    );
  }
}
