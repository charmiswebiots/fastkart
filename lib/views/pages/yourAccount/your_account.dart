import 'package:fastkart/views/pages/yourAccount/your_account_layout/your_account_body.dart';

import '../../../config.dart';

class YourAccount extends StatelessWidget {
  final yourAccountCtrl = Get.put(YourAccountController());

  YourAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => GetBuilder<YourAccountController>(builder: (_) {
        return  Directionality(
          textDirection:
          yourAccountCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: yourAccountCtrl.appCtrl.appTheme.whiteColor,
            appBar: YourAccountWidget().appBarLayout(
                bgColor: yourAccountCtrl.appCtrl.appTheme.whiteColor,
                titleColor: yourAccountCtrl.appCtrl.appTheme.titleColor,
                text: YourAccountFont().yourAccount,
                onTap: () => yourAccountCtrl.goToHome()),
            bottomNavigationBar: BottomNavigatorCard(
              selectedIndex: yourAccountCtrl.appCtrl.selectedIndex,
              onTap: (val) => yourAccountCtrl.bottomNavigationClick(val),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(8)),
                    child: const YourAccountBody(),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
