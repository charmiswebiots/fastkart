import '../../../config.dart';

class AddAddress extends StatelessWidget {
  final addAddressCtrl = Get.put(AddAddressController());

  AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<AddAddressController>(builder: (_) {
          return Scaffold(
            appBar: AddAddressWidget().appBarLayout(
                bgColor: addAddressCtrl.appCtrl.appTheme.whiteColor,
                titleColor: addAddressCtrl.appCtrl.appTheme.titleColor,
                image: addAddressCtrl.appCtrl.isTheme
                    ? imageAssets.themeFkLogo
                    : imageAssets.fkLogo,
                onTap: () => addAddressCtrl.goToSearch()),
            backgroundColor: addAddressCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: Container(
                color: addAddressCtrl.appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            BackgroundLayout(icon: iconAssets.truck),

                            // Content Layout
                            ContentBgLayout()
                          ],
                        ),
                      ),
                    ),

                    //confirm location and proceed button layout
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                      child: CustomButton(
                        height: 45,
                        title: AddAddressFont().  confirmLocation,
                        color: addAddressCtrl.appCtrl.appTheme.primary,
                        fontColor: addAddressCtrl.appCtrl.appTheme.whiteColor,
                        onTap: () => Get.toNamed(routeName.paymentScreen),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
