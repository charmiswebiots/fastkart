import 'package:fastkart/views/pages/addressList/util/address_list_constants.dart';
import 'package:fastkart/views/pages/addressList/util/address_list_fontstyle.dart';
import 'package:fastkart/views/pages/addressList/util/address_list_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class AddressListCard extends StatelessWidget {
  int? index;
  int? selectedIndex;
  var data;
  var containerColor;
  var titleColor;
  var primaryColor;
  var whiteColor;
  var darkContentColor;
  GestureTapCallback? onTap;
  AddressListCard({Key? key,this.index,this.selectedIndex,this.data,this.containerColor,this.titleColor,this.primaryColor,this.whiteColor,this.darkContentColor,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
        padding: EdgeInsets.symmetric(
            vertical:
            AppScreenUtil().screenHeight(15),
            horizontal:
            AppScreenUtil().screenWidth(15)),
        decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(color: selectedIndex == index ? primaryColor:containerColor,width: 1.5),
            borderRadius: BorderRadius.circular(
                AppScreenUtil().borderRadius(10))),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressListWidget()
                      .iconAndPlaceLayout(
                      index: index,
                      text:
                      data['place'],
                      textColor: titleColor,
                      defaultBoxColor: primaryColor,
                      defaultTextColor:
                      whiteColor),
                  Space(0, 8),
                  AddressListFontStyle().mulishtextLayout(
                      text: data['address'],
                      fontSize: AddressListFontSize.textSizeSMedium,
                      color: titleColor),
                  Space(0, 5),
                  AddressListFontStyle().mulishtextLayout(
                      text: data['area'],
                      fontSize: AddressListFontSize.textSizeSmall,
                      overflow: TextOverflow.clip,
                      color: darkContentColor)
                ],
              ),
            ),
            Image.asset(iconAssets.map1,height: AppScreenUtil().screenHeight(70),)
          ],
        ),
      ),
    );
  }
}
