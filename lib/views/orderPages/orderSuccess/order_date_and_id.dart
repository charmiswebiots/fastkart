import '../../../config.dart';

class OrderDateAndId extends StatelessWidget {
  final String? image;
  final String? title;
  final String? val;
  const OrderDateAndId({Key? key,this.image,this.title,this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10),vertical: AppScreenUtil().screenHeight(8)),
              decoration: BoxDecoration(
                  color: appCtrl.appTheme.primary,
                  borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))
              ),
              child: Image.asset(image!,height: AppScreenUtil().screenHeight(18),fit: BoxFit.contain,),
            ),
            Space(10, 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderSuccessFontStyle().mulishtextLayout(
                    text: title,
                    fontWeight: FontWeight.w700,
                    fontSize: OrderSuccessFontSize.textSizeSmall,
                    color: appCtrl.appTheme.titleColor),
                Space(0, 2),
                OrderSuccessFontStyle().mulishtextLayout(
                    text: val,
                    fontWeight: FontWeight.normal,
                    fontSize: OrderSuccessFontSize.textSizeSmall,
                    color: appCtrl.appTheme.darkContentColor),
              ],
            ),
          ],
        );
      }
    );
  }
}
