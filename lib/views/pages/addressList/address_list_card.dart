import '../../../config.dart';
import 'address_list_layout/icon_place_layout.dart';

class AddressListCard extends StatelessWidget {
  final int? index;
  final int? selectedIndex;
  final dynamic data;
  final GestureTapCallback? onTap;

  const AddressListCard(
      {Key? key, this.index, this.selectedIndex, this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressListController>(builder: (addAddressCtrl) {
      return InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(15),
              horizontal: AppScreenUtil().screenWidth(15)),
          decoration: BoxDecoration(
              color: addAddressCtrl.appCtrl.appTheme.wishtListBoxColor,
              border: Border.all(
                  color: selectedIndex == index
                      ? addAddressCtrl.appCtrl.appTheme.primary
                      : addAddressCtrl.appCtrl.appTheme.wishtListBoxColor,
                  width: 1.5),
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(10))),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconAndPlaceLayout(
                        index: index,
                        text: data['place'],),
                    const Space(0, 8),
                    AddressListFontStyle().mulishtextLayout(
                        text: data['address'],
                        fontSize: AddressListFontSize.textSizeSMedium,
                        color: addAddressCtrl.appCtrl.appTheme.titleColor),
                    const Space(0, 5),
                    AddressListFontStyle().mulishtextLayout(
                        text: data['area'],
                        fontSize: AddressListFontSize.textSizeSmall,
                        overflow: TextOverflow.clip,
                        color: addAddressCtrl.appCtrl.appTheme.darkContentColor)
                  ],
                ),
              ),
              Image.asset(
                iconAssets.map1,
                height: AppScreenUtil().screenHeight(70),
              )
            ],
          ),
        ),
      );
    });
  }
}
