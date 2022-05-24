import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/shop/shop_layout/category_drop_down.dart';

class CategorySelectionLayout extends StatelessWidget {
  const CategorySelectionLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (shopCtrl) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: shopCtrl.appCtrl.appTheme.wishtListBoxColor,
            //background color of dropdown button
            border: Border.all(color: shopCtrl.appCtrl.appTheme.borderColor, width: .5),
            //border of dropdown button
            borderRadius: BorderRadius.circular(
                AppScreenUtil().borderRadius(5)), //border raiuds of dropdown button
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(25)),
              child: const CategoryDropDown()),
        );
      }
    );
  }
}
