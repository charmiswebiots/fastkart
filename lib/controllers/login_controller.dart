import 'package:fastkart/views/pages/login/util/login_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginformKey = new GlobalKey<FormState>();
  final FocusNode userFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isEmail = false;
  String errorEmail = LoginFont().userFieldError;
  bool isPassword = false;
  bool passwordVisible = true;

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }
}
