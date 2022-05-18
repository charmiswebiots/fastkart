import '../../config.dart';

class AddressLayoutShimmer extends StatelessWidget {
  const AddressLayoutShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.circle,color: appCtrl.appTheme.lightGray,),
                const Space(10, 0),
                CommonShimmerWidget().commonShimmer(
                    color: appCtrl.appTheme.lightGray,
                    borderColor: appCtrl.appTheme.lightGray,
                    borderRadius: 0,
                    width: 150,
                    height: 10),
              ],
            ),
            const Space(0, 10),
            CommonShimmerWidget().commonShimmer(
                color: appCtrl.appTheme.lightGray,
                borderColor: appCtrl.appTheme.lightGray,
                borderRadius: 0,
                width: 150,
                height: 10),
          ],
        );
      }
    );
  }
}
