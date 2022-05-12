import 'package:fastkart/views/pages/payment/child_expandable.dart';

import '../../../config.dart';

class ExpandableListView extends StatelessWidget {
  final int? index;
  final String? title;
  final bool? isExpanded;
  final Color? lightPrimary;
  final Color? titleColor;
  final VoidCallback? onPressed;
  final Widget? child;

  const ExpandableListView({Key? key,this.index,this.titleColor,this.child,this.title,this.onPressed,this.lightPrimary,this.isExpanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: onPressed,
          child: Container(
            padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PaymentFontStyle().mulishtextLayout(
                    text: title,
                    fontSize: PaymentFontSize.textSizeSMedium,
                    fontWeight: FontWeight.w700),
                IconButton(
                    icon: Container(
                      height: AppScreenUtil().screenHeight(25),
                      width: AppScreenUtil().screenWidth(25),
                      decoration: BoxDecoration(
                        color: lightPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isExpanded!
                            ? Icons.keyboard_arrow_down
                            : Icons.arrow_forward_ios_outlined,
                        color: titleColor,
                        size: AppScreenUtil().size(isExpanded! ? 18 : 13),
                      ),
                    ),
                    onPressed: onPressed),
              ],
            ),
          ),
        ),
       ChildExpandable(

            collapsedHeight: 0.0,
            expandedHeight: AppScreenUtil().screenHeight(index == 0
                ? 190.0
                : index == 1 || index == 2
                ? 130
                : 60),
            expanded: isExpanded,
            child: child)
      ],
    );
  }
}
