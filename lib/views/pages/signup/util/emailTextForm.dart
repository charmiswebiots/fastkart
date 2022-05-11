import 'package:fastkart/views/pages/signup/util/signup_constants.dart';
import 'package:flutter/material.dart';

import '../../../../config.dart';

class EmailTextForm extends StatelessWidget {
  TextEditingController? email;
  FocusNode? emailFocus;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;

  EmailTextForm(
      {Key? key,
        this.email,
        this.emailFocus,
        this.onFieldSubmitted,
        this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return CommonTextFormField(
        controller: email,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: emailFocus,
        validator: validator,
        text: SignupFont().emailHint,
        suffixIcon: Image.asset(iconAssets.atsign,
            color: appCtrl.appTheme.titleColor),
        borderColor:
        appCtrl.appTheme.primary.withOpacity(.3),
        hintColor: appCtrl.appTheme.contentColor,
        fillcolor: appCtrl.appTheme.textBoxColor,
      );
    });
  }
}
