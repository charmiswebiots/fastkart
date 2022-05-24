import 'package:fastkart/shimmer_effect/add_address_shimmer/address_layout.dart';

import '../../config.dart';

class DataShimmer extends StatelessWidget {
  const DataShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          height: MediaQuery.of(context).size.height / 2.2,
          padding: EdgeInsets.only(
            top: AppScreenUtil().screenHeight(10),
          ),
          decoration: BoxDecoration(
              color: appCtrl.appTheme.lightGray.withOpacity(.5),
              borderRadius: BorderRadius.only(
                  topRight:
                  Radius.circular(AppScreenUtil().borderRadius(20)),
                  topLeft: Radius.circular(
                      AppScreenUtil().borderRadius(20)))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
            child: Column(
              children: [
                //how can we help textformfield layout
                CommonShimmerWidget().commonShimmer(
                    color: appCtrl.appTheme.lightGray,
                    borderColor: appCtrl.appTheme.lightGray,
                    borderRadius: 0,
                    width: MediaQuery.of(context).size.width,
                    height: 45),
                const Space(0, 20),
                Row(
                  children: [
                    //send location layout
                    CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.lightGray,
                        borderColor: appCtrl.appTheme.lightGray,
                        borderRadius: 0,
                        width: 50,
                        height: 50),
                    const Space(10, 0),
                    //use current location text layout
                    CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.lightGray,
                        borderColor: appCtrl.appTheme.lightGray,
                        borderRadius: 0,
                        width: 150,
                        height: 10),

                  ],
                ),
                const Space(0, 20),
                //address list Layout
                const AddressLayoutShimmer(),
                const Space(0, 8),
                 Divider(color: appCtrl.appTheme.lightGray,thickness: 2,),
                const Space(0, 8),
                const AddressLayoutShimmer(),
              ],
            ),
          ),
        );
      }
    );
  }
}
