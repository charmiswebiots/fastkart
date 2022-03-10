
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordVisible = true;

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }
}