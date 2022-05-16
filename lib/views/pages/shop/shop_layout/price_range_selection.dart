import 'package:fastkart/config.dart';


class PriceRangeSelection extends StatelessWidget {
  const PriceRangeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (shopCtrl) {
        return Column(
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: shopCtrl.appCtrl.appTheme.primary,
                inactiveTrackColor: shopCtrl.appCtrl.appTheme.wishtListBoxColor,
                thumbColor: shopCtrl.appCtrl.appTheme.primary,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              ),
              child: RangeSlider(
                values: shopCtrl.currentRangeValues,
                min: 0,
                max: 100,
                labels: RangeLabels(
                  shopCtrl.currentRangeValues.start.round().toString(),
                  shopCtrl.currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  shopCtrl.currentRangeValues = values;
                  shopCtrl.update();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RangeValueLayout(
                    text: shopCtrl.currentRangeValues.start.round().toString(),),
                RangeValueLayout(
                    text: shopCtrl.currentRangeValues.end.round().toString(),),

              ],
            )
          ],
        );
      }
    );
  }
}
