import '../../../config.dart';

class AddressListScreen extends StatelessWidget {
  final addAddressCtrl = Get.put(AddressListController());

  AddressListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<AddressListController>(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: addAddressCtrl.appCtrl.appTheme.whiteColor,
              titleSpacing: 0,
              centerTitle: false,
              leading: AddressListWidget().appBarLeadingLayput(
                onTap: () => Get.back(),
              ),
              title: AddressListWidget().appBarTitleLayout(
                  text: AddressListFont().selectDeliveryAddress,
                  textColor: addAddressCtrl.appCtrl.appTheme.titleColor),
              actions: [
                AddressListWidget().appBarActionLayout(
                    iconColor: addAddressCtrl.appCtrl.appTheme.titleColor),
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
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: AppScreenUtil().screenHeight(50)),
                        child: Column(
                          children: [
                            AddressListWidget().addAddressLayout(
                                context: context,
                                borderColor: addAddressCtrl
                                    .appCtrl.appTheme.contentColor,
                                color: addAddressCtrl
                                    .appCtrl.appTheme.darkContentColor),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppScreenUtil().screenHeight(10),
                                  horizontal: AppScreenUtil().screenWidth(15)),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: AppArray().newAddressList.length,
                                itemBuilder: (context, index) {
                                  return AddressListCard(
                                    onTap: () =>
                                        addAddressCtrl.selectAddress(index),
                                    data: AppArray().newAddressList[index],
                                    index: index,
                                    selectedIndex: addAddressCtrl.selectedIndex,
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    AddressListWidget().proceedPaymentButtonLayout(
                        context: context,
                        buttonColor: addAddressCtrl.appCtrl.appTheme.primary,
                        itemColor: addAddressCtrl.appCtrl.appTheme.white)
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
