import '../../../config.dart';

class AddressLayout extends StatelessWidget {
  const AddressLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            OrderTrackStyle()
                .commonLayoutForIcon(
                image: iconAssets.home,
                boxColor: appCtrl
                    .appTheme
                    .primary,
                borderColor:
                appCtrl
                    .appTheme
                    .primary),
            const  Space(10, 0),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                OrderTrackFontStyle()
                    .mulishtextLayout(
                    text:
                    "8857 Morris Rd. ,Charlottesville, VA 22901",
                    fontWeight:
                    FontWeight.w700,
                    fontSize:
                    OrderTrackFontSize
                        .textSizeSmall,
                    color: appCtrl
                        .appTheme
                        .titleColor),
                OrderTrackFontStyle().mulishtextLayout(
                    text: OrderTrackFont().storeLocation,
                    fontWeight:
                    FontWeight.normal,
                    fontSize:
                    OrderTrackFontSize
                        .textXSizeSmall,
                    color: appCtrl
                        .appTheme
                        .darkContentColor),
              ],
            ),
          ],
        );
      }
    );
  }
}
