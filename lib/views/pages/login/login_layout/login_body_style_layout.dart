import 'dart:io';

import 'package:fastkart/utilities/responsive_layout.dart';

import '../../../../config.dart';

class LoginBodyStyleLayout extends StatelessWidget {
  final Color? color;
  final dynamic loginformKey;
  final Widget? child;
  const LoginBodyStyleLayout({Key? key,this.child,this.color,this.loginformKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height /
              (Platform.isIOS ? 9.2 : AppScreenUtil().size(7.2))),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().size(15),
          vertical: AppScreenUtil().size(25)),
      width: MediaQuery.of(context).size.width,
      height: AppScreenUtil().screenActualHeight(),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppScreenUtil().borderRadius(22)),
              topRight: Radius.circular(AppScreenUtil().borderRadius(22)))),
      child: Form(
        key: loginformKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height /
                  AppScreenUtil().screenHeight(
                      (ResponsiveWidget.isSmallScreen(context)) ? 1.52 : 1.14),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
