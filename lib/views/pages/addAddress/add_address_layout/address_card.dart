import '../../../../config.dart';

class AddressCard extends StatelessWidget {
  final dynamic data;
  final int? lastIndex;
  final int? index;

  const AddressCard({Key? key,this.data,this.index,this.lastIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Padding(
        padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  iconAssets.addreesslocation,
                  fit: BoxFit.fitWidth,
                  height: AppScreenUtil().screenHeight(16),
                  color: appCtrl.appTheme.titleColor,
                ),
                Space(8, 0),
                AddAddressFontStyle().mulishtextLayout(
                    text: data['address'],
                    fontSize: AddAddressFontSize.textSizeSMedium,
                    color: appCtrl.appTheme.titleColor)
              ],
            ),
            Space(0, 8),
            AddAddressFontStyle().mulishtextLayout(
                text: data['area'],
                fontSize: AddAddressFontSize.textSizeSmall,
                color: appCtrl.appTheme.darkContentColor),
            Space(0, 10),
            if (index != lastIndex)
              Divider(
                color: appCtrl.appTheme.contentColor,
              )
          ],
        ),
      );
    });
  }
}
