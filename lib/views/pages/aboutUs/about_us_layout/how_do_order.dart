import '../../../../config.dart';

class HowDoOrderLayout extends StatelessWidget {
  const HowDoOrderLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
      builder: (aboutUsCtrl) {
        return SizedBox(
          height: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370
                  ? 430
                  : 450),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppArray().howToOrder.length,
            itemBuilder: (context, index) {
              return HowDoOrderCard(
                data: AppArray().howToOrder[index],
                containerColor: aboutUsCtrl.appCtrl.appTheme.wishtListBoxColor,
                titleColor: aboutUsCtrl.appCtrl.appTheme.titleColor,
                darkContentColor: aboutUsCtrl.appCtrl.appTheme.darkContentColor,
                primaryColor: aboutUsCtrl.appCtrl.appTheme.primary,
                whiteColor:aboutUsCtrl.appCtrl.appTheme.white,
              );
            },
          ),
        );
      }
    );
  }
}
