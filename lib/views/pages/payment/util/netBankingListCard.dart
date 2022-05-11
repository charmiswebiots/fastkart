
import 'package:flutter/cupertino.dart';
import '../../../../config.dart';

class NetBankingListCard extends StatelessWidget {
  var data;
  GestureTapCallback? onTap;
  var titleColor;
  var primaryColor;
  int? index;
  int? selectindex;
   NetBankingListCard({Key? key,this.data,this.onTap,this.titleColor,this.index,this.selectindex,this.primaryColor}) : super(key: key);

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
