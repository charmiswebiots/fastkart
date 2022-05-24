import '../../../config.dart';

class AddAddress extends StatelessWidget {
  final addAddressCtrl = Get.put(AddAddressController());

  AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return GetBuilder<AddAddressController>(builder: (_) {
        return Directionality(
          textDirection: addAddressCtrl.appCtrl.isRTL
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: AddAddressWidget().appBarLayout(
                isRTL: addAddressCtrl.appCtrl.isRTL,
                bgColor: addAddressCtrl.appCtrl.appTheme.whiteColor,
                titleColor: addAddressCtrl.appCtrl.appTheme.titleColor,
                image: addAddressCtrl.appCtrl.isTheme
                    ? imageAssets.themeFkLogo
                    : imageAssets.fkLogo,
                onTap: () => addAddressCtrl.goToSearch()),
            backgroundColor: addAddressCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: addAddressCtrl.isLoading
                  ? const AddAddressPageShimmer()
                  : Container(
                      color: addAddressCtrl.appCtrl.appTheme.whiteColor,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          const AddAddressDataLayout(),

                          //confirm location and proceed button layout
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(15)),
                            child: CustomButton(
                              height: 45,
                              title: AddAddressFont().confirmLocation,
                              color: addAddressCtrl.appCtrl.appTheme.primary,
                              fontColor:
                                  addAddressCtrl.appCtrl.appTheme.whiteColor,
                              onTap: () => Get.toNamed(routeName.paymentScreen),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        );
      });
    });
  }
}
