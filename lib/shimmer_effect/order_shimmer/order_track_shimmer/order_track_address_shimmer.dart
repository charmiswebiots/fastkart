import '../../../config.dart';

class OrderTrackAddressShimmer extends StatelessWidget {
  const OrderTrackAddressShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      width: 45,
                      borderRadius: 2,
                      height: 40,
                      child: Icon(
                        Icons.circle,
                        color: appCtrl.appTheme.darkGray,
                      )),
                  const Space(10, 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderColor:
                              appCtrl.appTheme.lightGray.withOpacity(.5),
                          width: 150,
                          borderRadius: 2,
                          height: 10),
                      const Space(0, 8),
                      CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderColor:
                              appCtrl.appTheme.lightGray.withOpacity(.5),
                          width: 120,
                          borderRadius: 2,
                          height: 10),
                    ],
                  ),
                ],
              ),
              if (index != 1) OrderTrackStyle().verticalLineDivider(),
            ],
          ),
        ),
      );
    });
  }
}
