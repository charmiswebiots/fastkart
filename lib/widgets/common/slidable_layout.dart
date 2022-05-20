import 'package:flutter_slidable/flutter_slidable.dart';

import '../../config.dart';

class SlidableLayout extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? plusTap;
  final GestureTapCallback? minusTap;
  final bool? isCart;

  const SlidableLayout({Key? key, this.plusTap, this.minusTap, this.data,this.isCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Builder(
        builder: (context) {
          return Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.32,
              motion: const ScrollMotion(),
              children: [
                MyCartStyle().deleteLayout(
                    primaryColor: appCtrl.appTheme.primary, onTap: () => {})
              ],
            ),
            child: CommonOfferListCard(
              onTap: () async {
                await appCtrl.getStorage.write(
                    'selectedIndex', appCtrl.selectedIndex);
                appCtrl.selectedIndex = 3;
                appCtrl.update();
              },
              isColor: true,
              data:data,
              minusTap: plusTap,
              plusTap: minusTap,
            ),
          );
        }
      );
    });
  }
}
