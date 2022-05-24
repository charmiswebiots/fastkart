import '../../../../config.dart';

class SelectionLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? text;
  const SelectionLayout({Key? key,this.text,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (productDetailCtrl ) {
        return InkWell(
            onTap: onTap,
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: AppScreenUtil().screenHeight(10),
                    horizontal: AppScreenUtil().screenWidth(10)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: productDetailCtrl.appCtrl.appTheme.wishtListBoxColor,
                    borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(5))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDetailFontStyle().mulishtextLayout(
                          text: text!, fontSize: 14, color: productDetailCtrl.appCtrl.appTheme.titleColor),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: AppScreenUtil().size(16),
                      )
                    ])));
      }
    );
  }
}
