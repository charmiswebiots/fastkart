

import '../../config.dart';

class DeliveryTimeShimmer extends StatelessWidget {
  const DeliveryTimeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15),
              vertical: AppScreenUtil().screenHeight(12)),
          child: CommonShimmerWidget().commonShimmer(
              color: appCtrl.appTheme.gray.withOpacity(.5),
              borderColor: appCtrl.appTheme.gray.withOpacity(.5),
              borderRadius: 0,
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: appCtrl.appTheme.gray,
                    ),
                    CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.gray,
                        borderColor: appCtrl.appTheme.gray,
                        borderRadius: 0,
                        width: 150,
                        height: 10),
                  ],
                ),
              )),
        );
      }
    );
  }
}
