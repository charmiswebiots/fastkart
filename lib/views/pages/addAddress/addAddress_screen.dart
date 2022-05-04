import 'package:fastkart/controllers/addAddress_controller.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/addAddress/util/addAddress_constants.dart';
import 'package:fastkart/views/pages/addAddress/util/addAddress_fontstyle.dart';
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
              titleSpacing: 0,
              centerTitle: false,
              leading: AddAddressWidget().appBarLeadingLayput(
                  onTap: () => Get.back(),
                  borderColor: addAddressCtrl.appCtrl.appTheme.titleColor,
                  iconColor: addAddressCtrl.appCtrl.appTheme.titleColor,
                  image: addAddressCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo),
              title: AddAddressWidget().appBarTitleLayout(
                  text: AddAddressFont().addAddress,
                  textColor: addAddressCtrl.appCtrl.appTheme.titleColor),
              actions: [
                AddAddressWidget().appBarActionLayout(
                    iconColor: addAddressCtrl.appCtrl.appTheme.titleColor),
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

                  children: [
                    SingleChildScrollView(
                      child: Container(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            AddAddressWidget().backgroundLayout(
                                context: context,
                                containerColor:
                                    addAddressCtrl.appCtrl.appTheme.whiteColor,
                                textColor:
                                    addAddressCtrl.appCtrl.appTheme.titleColor,
                                icon: iconAssets.truck),

                            // Content Layout
                            AddAddressWidget().contentBGLayout(
                                context: context,
                                color:
                                    addAddressCtrl.appCtrl.appTheme.whiteColor,
                                child: Column(
                                  children: [
                                    //how can we help textformfield layout
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                              AppScreenUtil().screenHeight(20),
                                          right:
                                              AppScreenUtil().screenHeight(20)),
                                      child: AddAddressWidget().textFieldLayout(
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: AppScreenUtil()
                                                  .screenHeight(10)),
                                          child: Image.asset(
                                            iconAssets.voice,
                                            fit: BoxFit.contain,
                                            color: addAddressCtrl
                                                .appCtrl.appTheme.titleColor,
                                            height: AppScreenUtil()
                                                .screenHeight(10),
                                            width:
                                                AppScreenUtil().screenWidth(10),
                                          ),
                                        ),
                                        suffixIcon: Image.asset(
                                          iconAssets.textboxSearchIcon,
                                          color: addAddressCtrl
                                              .appCtrl.appTheme.titleColor,
                                        ),
                                        text: AddAddressFont().howCanWeHelp,
                                        borderColor: addAddressCtrl
                                            .appCtrl.appTheme.primary
                                            .withOpacity(.3),
                                        hintColor: addAddressCtrl
                                            .appCtrl.appTheme.contentColor,
                                        fillcolor: addAddressCtrl
                                            .appCtrl.appTheme.textBoxColor,
                                      ),
                                    ),
                                    Space(0, 20),
                                    Row(
                                      children: [
                                        //send location layout
                                        AddAddressWidget().sendLocationLayout(
                                            boxColor: addAddressCtrl
                                                .appCtrl.appTheme.primary,
                                            icon: iconAssets.send),
                                        Space(10, 0),
                                        //use current location text layout
                                        AddAddressFontStyle().mulishtextLayout(
                                            text: AddAddressFont()
                                                .useCurrentLocation,
                                            fontWeight: FontWeight.w700,
                                            color: addAddressCtrl
                                                .appCtrl.appTheme.titleColor,
                                            fontSize: AddAddressFontSize
                                                .textSizeMedium)
                                      ],
                                    ),
                                    //address list Layout
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              AppScreenUtil().screenWidth(20),
                                          vertical:
                                              AppScreenUtil().screenHeight(20)),
                                      child: Column(
                                        children: [
                                          ...AppArray()
                                              .addressList
                                              .asMap()
                                              .entries
                                              .map((e) {
                                            return AddAddressWidget().addressListCard(
                                                data: e.value,
                                                index: e.key,
                                                iconColor: addAddressCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .titleColor,
                                                lastIndex: AppArray()
                                                        .addressList
                                                        .length -
                                                    1,
                                                dividerColor: addAddressCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .contentColor,
                                                darkContentColor: addAddressCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .darkContentColor,
                                                addressColor: addAddressCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .titleColor);
                                          }).toList()
                                        ],
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    AddAddressWidget().confirmLocationButtonLayout(
                        context: context,
                        onTap: () => Get.toNamed(routeName.paymentScreen),
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
