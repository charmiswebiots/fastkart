import '../../../../config.dart';

class ExpandableIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool? isExpanded;
  final Color? lightPrimary;
  final Color? titleColor;
  const ExpandableIcon({Key? key,this.isExpanded,this.onPressed,this.titleColor,this.lightPrimary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (context) {
        return IconButton(
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
            onPressed: onPressed);
      }
    );
  }
}
