import '../../../../config.dart';

class BodyComponent extends StatelessWidget {
  const BodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartListController>(
      builder: (wishListCtrl) {
        return MyCartStyle().bodyComponentLayout(
            child: const MyCartBodyLayout(),
            proceesToCheckout: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                  AppScreenUtil().screenWidth(15)),
              child: CustomButton(
                height: 45,
                title: MyCartFont().proceedtoCheckout,
                color:
                wishListCtrl.appCtrl.appTheme.primary,
                fontColor: wishListCtrl
                    .appCtrl.appTheme.whiteColor,
                onTap: () =>
                    Get.toNamed(routeName.addAddress),
              ),
            ));
      }
    );
  }
}
