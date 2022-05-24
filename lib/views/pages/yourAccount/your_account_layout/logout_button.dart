
import 'dart:math' as math;
import '../../../../config.dart';

class LogoutButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? text;
  const LogoutButton({Key? key,this.onTap,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YourAccountController>(
      builder: (yourAccountCtrl) {
        return Directionality(
          textDirection: yourAccountCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: AppScreenUtil().screenWidth(150),
              margin: EdgeInsets.only(
                  left: AppScreenUtil().screenWidth(15),
                  top: AppScreenUtil().screenHeight(10)),
              padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10),vertical: AppScreenUtil().screenHeight(10)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppScreenUtil().borderRadius(5)),
                  color: yourAccountCtrl
                      .appCtrl.appTheme.wishtListBoxColor),
              child: Row(
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: yourAccountCtrl.appCtrl.languageVal == "ar" || yourAccountCtrl.appCtrl.isRTL
                        ? Matrix4.rotationY(math.pi)
                        : Matrix4.rotationX(math.pi),
                    child:  Image.asset(iconAssets.logout1,height: AppScreenUtil().screenHeight(30),),
                  ),

                  const Space(10, 0),
                  YourAccountFontStyle()
                      .mulishtextLayout(
                      text:text,
                      fontSize: 14,
                      color: yourAccountCtrl
                          .appCtrl.appTheme.titleColor),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
