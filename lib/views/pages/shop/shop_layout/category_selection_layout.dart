import 'package:fastkart/config.dart';
import 'package:google_fonts/google_fonts.dart';

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
              child: DropdownButton(
                value: shopCtrl.dropDownVal,
                items: const [
                  //add items in the dropdown
                  DropdownMenuItem(
                    child: Text("Fresh Fruits& Vegetables"),
                    value: "Fresh Fruits& Vegetables",
                  ),
                  DropdownMenuItem(
                      child: Text("Oils,Refined & Ghee"),
                      value: "Oils,Refined & Ghee"),
                  DropdownMenuItem(
                    child: Text("Rice, Flour & Gains"),
                    value: "Rice, Flour & Gains",
                  ),
                  DropdownMenuItem(
                    child: Text("Food Cupboard"),
                    value: "Food Cupboard",
                  ),
                  DropdownMenuItem(
                    child: Text("Drink& Beverages"),
                    value: "Drink& Beverages",
                  ),
                  DropdownMenuItem(
                    child: Text("Instant Mixes"),
                    value: "Instant Mixes",
                  )
                ],
                onChanged: (value) {
                  //get value when changed
                  shopCtrl.dropDownVal = value.toString();
                  shopCtrl.update();
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: shopCtrl.appCtrl.appTheme.titleColor,
                ),
                //Icon color
                style: TextStyle(
                  //te
                    color: shopCtrl.appCtrl.appTheme.titleColor, //Font color
                    fontFamily: GoogleFonts.mulish().fontFamily,
                    fontSize: AppScreenUtil().fontSize(ShopFontSize
                        .textSizeSMedium) //font size on dropdown button
                ),
                underline: Container(),
                //remove underline
                isExpanded: true, //make true to make width 100%
              )),
        );
      }
    );
  }
}
