import '../../../config.dart';

class AddressListScreen extends StatelessWidget {
  final addAddressCtrl = Get.put(AddressListController());

  AddressListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<AddressListController>(builder: (_) {
          return Directionality(
            textDirection: addAddressCtrl.appCtrl.isRTL
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: addAddressCtrl.appCtrl.appTheme.whiteColor,
                titleSpacing: 0,
                centerTitle: false,
                leading: CommonAppBarLeading(
                  onTap: () => Get.back(),
                  isImage: false,
                ),
                title: AddressListStyle().appBarTitleLayout(
                    text: AddressListFont().selectDeliveryAddress,
                    textColor: addAddressCtrl.appCtrl.appTheme.titleColor),
                actions: [
                  AppBarHomeIconLayout(
                    icon: iconAssets.blacktextboxSearchIcon,
                    onTap: () {},
                  ),
                ],
              ),
              backgroundColor: addAddressCtrl.appCtrl.appTheme.whiteColor,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: Container(
                  color: addAddressCtrl.appCtrl.appTheme.whiteColor,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AddressListDataLayout(),
                      AddressListWidget().proceedPaymentButtonLayout(
                          context: context,
                          buttonColor: addAddressCtrl.appCtrl.appTheme.primary,
                          itemColor: addAddressCtrl.appCtrl.appTheme.white)
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
