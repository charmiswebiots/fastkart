import 'package:fastkart/views/pages/payment/util/payment_constants.dart';
import 'package:fastkart/views/pages/payment/util/payment_fontstyle.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class NetBakingLayout extends StatelessWidget {
  var titleColor;
  var contentColor;
  Widget? child;
  ValueChanged<bool>? onExpansionChanged;
  bool? isShow;
  String? text;
  var keys;
  int? index;
  bool? isExpandable;
  NetBakingLayout({Key? key,this.titleColor,this.child,this.onExpansionChanged,this.isShow,this.contentColor,this.text,this.keys,this.index,this.isExpandable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(dividerColor: Colors.transparent),
      child: Column(
        children: [
          ExpansionTile(
            initiallyExpanded: isExpandable!,
            key: Key(keys.toString()),
            tilePadding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(15),
                right: AppScreenUtil().screenWidth(15)),
            childrenPadding: EdgeInsets.symmetric(
                horizontal:
                AppScreenUtil().screenWidth(5),
                vertical: 0),
            title: PaymentFontStyle().mulishtextLayout(
                text: text,
                fontWeight: FontWeight.w700,
                color: titleColor,
                fontSize:
                PaymentFontSize.textSizeSMedium),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: AppScreenUtil().size(16),
            ),
            onExpansionChanged: onExpansionChanged,
            children: [
              child!
            ],
          ),
          
          Divider(
            color: contentColor,
            thickness: .5,
            indent: 15,
            endIndent: 15,
            height: 0,
          )
        ],
      ),
    );
  }
}
