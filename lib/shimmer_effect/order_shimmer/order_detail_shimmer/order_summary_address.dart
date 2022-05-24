import 'package:fastkart/config.dart';

class OrderSummaryAddress extends StatelessWidget {
  final bool? isShow;
  const OrderSummaryAddress({Key? key,this.isShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonShimmerWidget().commonShimmer(
                color: appCtrl.appTheme.lightGray.withOpacity(.5),
                borderColor:
                appCtrl.appTheme.lightGray.withOpacity(.5),
                width: 80,
                borderRadius: 2,
                height: 10,
              ),
              const Space(0, 10),
              Row(
                children: [
                  if(!isShow!)
                    CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor:
                      appCtrl.appTheme.lightGray.withOpacity(.5),
                      width: 35,
                      borderRadius: 2,
                      height: 35,
                    ),
                  if(!isShow!)
                    const Space(10, 0),
                  CommonShimmerWidget().commonShimmer(
                    color: appCtrl.appTheme.lightGray.withOpacity(.5),
                    borderColor:
                    appCtrl.appTheme.lightGray.withOpacity(.5),
                    width: 100,
                    borderRadius: 2,
                    height: 8,
                  ),
                ],
              ),
              const Space(0, 8),
              if(isShow!)
              CommonShimmerWidget().commonShimmer(
                color: appCtrl.appTheme.lightGray.withOpacity(.5),
                borderColor:
                appCtrl.appTheme.lightGray.withOpacity(.5),
                width: 90,
                borderRadius: 2,
                height: 8,
              ),
            ],
          ),
        );
      }
    );
  }
}
