import '../../../../config.dart';

class SelectCardLayout extends StatelessWidget {
  final Color? titleColor;
  final Color? contentColor;
  final Widget? child;
  final ValueChanged<bool>? onExpansionChanged;
  final bool? isShow;
  final String? text;
  final dynamic keys;
  final int? index;
  final bool? initiallyExpanded;
  const SelectCardLayout({Key? key,this.titleColor,this.child,this.onExpansionChanged,this.isShow,this.contentColor,this.text,this.keys = -1,this.index,this.initiallyExpanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(dividerColor: Colors.transparent),
      child: Column(
        children: [
          ExpansionTile(
            initiallyExpanded: initiallyExpanded!,
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
          Space(0, isShow! ? 10 :0),
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
