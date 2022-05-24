import '../../../../config.dart';

class ExpandableListView extends StatelessWidget {
  final int? index;
  final String? title;
  final bool? isExpanded;
  final Color? lightPrimary;
  final Color? titleColor;
  final VoidCallback? onPressed;
  final Widget? child;

  const ExpandableListView(
      {Key? key,
      this.index,
      this.titleColor,
      this.child,
      this.title,
      this.onPressed,
      this.lightPrimary,
      this.isExpanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PaymentFontStyle().mulishtextLayout(
                    text: title,
                    fontSize: PaymentFontSize.textSizeSMedium,
                    fontWeight: FontWeight.w700),
                ExpandableIcon(
                    onPressed: onPressed,
                    isExpanded: isExpanded,
                    lightPrimary: lightPrimary,
                    titleColor: titleColor),
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
