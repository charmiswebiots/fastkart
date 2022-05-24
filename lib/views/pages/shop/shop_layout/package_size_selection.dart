import 'package:fastkart/config.dart';

class PackageSizeSelection extends StatelessWidget {
  const PackageSizeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (shopCtrl) {
        return GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: AppArray().packageSizeList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                shopCtrl.packSizeIndex = index;
                shopCtrl.update();
              },
              child: Container(
                height: AppScreenUtil().screenHeight(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == shopCtrl.packSizeIndex
                      ? shopCtrl.appCtrl.appTheme.primary
                      : shopCtrl.appCtrl.appTheme.wishtListBoxColor,
                  borderRadius: BorderRadius.circular(
                      AppScreenUtil().borderRadius(5)),
                  border: Border.all(
                      color: shopCtrl.appCtrl.isTheme
                          ? shopCtrl.appCtrl.appTheme.gray
                          : shopCtrl.appCtrl.appTheme.primary.withOpacity(.2),
                      width: .5), //border of dropdown button
                ),
                child: ShopFontStyle().mulishtextLayout(
                    text: AppArray()
                        .packageSizeList[index]['title']
                        .toString(),
                    fontSize: ShopFontSize.textSizeSMedium,
                    color: index == shopCtrl.packSizeIndex
                        ? shopCtrl.appCtrl.appTheme.white
                        : shopCtrl.appCtrl.appTheme.darkContentColor),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 7)),
        );
      }
    );
  }
}
