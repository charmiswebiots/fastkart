import '../../../../config.dart';

class AddressListDataLayout extends StatelessWidget {
  const AddressListDataLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressListController>(
      builder: (addAddressCtrl) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                bottom: AppScreenUtil().screenHeight(50)),
            child: Column(
              children: [
                AddAddressButtonLayout(
                  onTap: () => addAddressCtrl
                      .addAddressBottomSheet(context: context),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(10),
                      horizontal:
                      AppScreenUtil().screenWidth(15)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppArray().newAddressList.length,
                    itemBuilder: (context, index) {
                      return AddressListCard(
                        onTap: () =>
                            addAddressCtrl.selectAddress(index),
                        data: AppArray().newAddressList[index],
                        index: index,
                        selectedIndex:
                        addAddressCtrl.selectedIndex,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
