import 'package:google_fonts/google_fonts.dart';

import '../../../../config.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (shopCtrl) {
        return DropdownButton(
          value: shopCtrl.dropDownVal,
          items:  [
            //add items in the dropdown
            DropdownMenuItem(
              child: Text(ShopFont().freshFruitsVegetables),
              value: "Fresh Fruits& Vegetables",
            ),
            DropdownMenuItem(
                child: Text(ShopFont().oilsRefinedGhee),
                value: "Oils,Refined & Ghee"),
            DropdownMenuItem(
              child: Text(ShopFont().riceFlourGains),
              value: "Rice, Flour & Gains",
            ),
            DropdownMenuItem(
              child: Text(ShopFont().foodCupboard),
              value: "Food Cupboard",
            ),
            DropdownMenuItem(
              child: Text(ShopFont().drinkBeverages),
              value: "Drink& Beverages",
            ),
            DropdownMenuItem(
              child: Text(ShopFont().instantMixes),
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
        );
      }
    );
  }
}
