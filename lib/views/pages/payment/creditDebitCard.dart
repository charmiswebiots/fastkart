import 'package:fastkart/views/pages/payment/util/payment_fontstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config.dart';

class CreditDebitCard extends StatelessWidget {
  var data;
  GestureTapCallback? onTap;
  var titleColor;
  var primaryColor;
  int? index;
  int? selectindex;
  CreditDebitCard({Key? key,this.data,this.onTap,this.titleColor,this.index,this.selectindex,this.primaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(selectindex == index ? Icons
              .radio_button_checked : CupertinoIcons.circle,size: AppScreenUtil().size(18),color: primaryColor,),
          Space(8, 0),
          PaymentFontStyle().mulishtextLayout(
              text: data['title'],
              fontSize:
              9,
              color: titleColor,
              overflow: TextOverflow.clip,
              fontWeight:
              FontWeight.w600)
        ],
      ),
    );
  }
}
