import 'package:fastkart/views/pages/login/util/login_constants.dart';
import 'package:fastkart/views/pages/login/util/login_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final FocusNode userFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isEmail = false;
  String errorEmail = LoginFont().userFieldError;
  bool isPassword = false;

  emailValid () {
    if (email.text != '' && email.text != null) {
      String? check = LoginValidation().checkIDValidation(email.text);
      print('email : $check');
      if(check != null) {
        if (check == LoginFont().userFieldError) {
          isEmail = true;
          errorEmail = LoginFont().userFieldError;
        } else if (check == LoginFont().inCorrectUsername) {
          isEmail = true;
          errorEmail = LoginFont().inCorrectUsername;
        } else {}
        update();
      }else{
        isEmail = false;
        update();
      }
    }else{
      isEmail = true;
      update();
    }
    update();
  }

  passwordValid () {
    print(password.text);
    if (password.text != '' && password.text != null) {
      print('v ' + password.text);
      String? check = LoginValidation().checkPasswordValidation(password.text);
      print('checkdfdg : $check');
      if(check != null) {
        isPassword = true;
        update();
      }else{
        isPassword = false;
        update();
      }
    }else{
      print('pass');
      isPassword = true;
      update();
    }
  }
}