import 'package:fastkart/config.dart';

class CommonAppBar1 extends StatelessWidget {
  final GestureTapCallback? onTap;
  final GestureTapCallback? actionTap;
  final bool? isLocation;
  final bool? isCart;
  final bool? isCategory;
  final bool? isBack;
  final bool? isWishListText;
  final bool? isHome;
  final Color? color;
  final bool? isTheme;
  final Color? borderColor;

  const CommonAppBar1(
      {Key? key,
      this.onTap,
      this.actionTap,
      this.isCart,
      this.isLocation,
      this.isBack,
      this.isHome,
      this.borderColor,
      this.isWishListText,
      this.isCategory,
      this.color,
      this.isTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return AppBarWidget().appBarLayout(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                if (isCategory!)
                  AppBarStyle().categoryIcon(
                    language: appCtrl.languageVal,
                      isRTL: appCtrl.isRTL, onTap: onTap, color: color),
                if (isBack!) CommonAppBarLeading(onTap: onTap, isImage: false),
                const Space(10, 0),
                AppBarWidget().commonIconImage(
                    image: isTheme!
                        ? imageAssets.themeLogo
                        : imageAssets.smallLogoImage,
                    height: 16),
                const Space(10, 0),
                if (isWishListText!)
                  AppBarFontStyle().mulishtextLayout(
                      text: "(4 + " + 'items'.tr + ')',
                      fontSize: 14,
                      fontWeight: FontWeight.normal)
              ]),
              if (isLocation!) const AppbarUserIconLocation(),
              if (isCart!)
                AppBarStyle()
                    .offerIcon(isRTL: appCtrl.isRTL, actionTap: actionTap),
              if (isHome!)
                AppBarWidget()
                    .homeIcon(isRTL: appCtrl.isRTL, actionTap: actionTap),
            ],
          ),
          context: context);
    });
  }
}
