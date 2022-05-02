import 'package:fastkart/controllers/addAddress_controller.dart';
import 'package:fastkart/views/pages/addAddress/util/addAddress_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class AddAddress extends StatelessWidget {
  var addAddressCtrl = Get.put(AddAddressController());
  AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<AddAddressController>(builder: (_) {
          return Scaffold(

            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: addAddressCtrl.appCtrl.appTheme.whiteColor,

              centerTitle: false,
              leading: AddAddressWidget().appBarLeadingLayput(
                  onTap: () => Get.back(),
                  borderColor: addAddressCtrl.appCtrl.appTheme.titleColor,
                  iconColor: addAddressCtrl.appCtrl.appTheme.titleColor,
                  image: addAddressCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo),
              title: AddAddressWidget().appBarTitleLayout(
                  text: "Add Address",
                  textColor: addAddressCtrl.appCtrl.appTheme.titleColor),
              actions: [
                AddAddressWidget().appBarActionLayout(),
              ],
            ),
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
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        child: Image.asset(imageAssets.map,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,))
                    ),
                    AddAddressWidget().amountButtonLayout(
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
