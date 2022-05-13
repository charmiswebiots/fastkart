import '../../../../config.dart';

class ContentBgLayout extends StatelessWidget {
  final TextEditingController? txtcontroller;

  const ContentBgLayout({Key? key, this.txtcontroller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<AddAddressController>(builder: (addAddressCtrl) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.8,
          padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(10)),
          decoration: BoxDecoration(
              color: appCtrl.appTheme.whiteColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppScreenUtil().borderRadius(20)),
                  topLeft: Radius.circular(AppScreenUtil().borderRadius(20)))),
          child: Column(
            children: [
              //how can we help textformfield layout
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppScreenUtil().screenWidth(15)),
                child: CommonTextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: txtcontroller,
                  text: AddAddressFont().howCanWeHelp,
                  prefixIcon:
                      AddAddressStyle().prefixIcon(appCtrl.appTheme.titleColor),
                  suffixIcon: Image.asset(
                    iconAssets.textboxSearchIcon,
                    color: addAddressCtrl.appCtrl.appTheme.titleColor,
                  ),
                  borderColor:
                      addAddressCtrl.appCtrl.appTheme.primary.withOpacity(.3),
                  hintColor: addAddressCtrl.appCtrl.appTheme.contentColor,
                  fillcolor: addAddressCtrl.appCtrl.appTheme.textBoxColor,
                ),
              ),
              Space(0, 20),
              Row(
                children: [
                  //send location layout
                  AddAddressWidget().sendLocationLayout(
                      boxColor: addAddressCtrl.appCtrl.appTheme.primary,
                      icon: iconAssets.send),
                  Space(10, 0),
                  //use current location text layout
                  AddAddressStyle().useCurrentLocation(
                      addAddressCtrl.appCtrl.appTheme.titleColor)
                ],
              ),
              //address list Layout
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppScreenUtil().screenWidth(20),
                    vertical: AppScreenUtil().screenHeight(20)),
                child: Column(
                  children: [
                    ...AppArray().addressList.asMap().entries.map((e) {
                      return AddressCard(
                        data: e.value,
                        index: e.key,
                        lastIndex: AppArray().addressList.length - 1,
                      );
                    }).toList()
                  ],
                ),
              )
            ],
          ),
        );
      });
    });
  }
}
