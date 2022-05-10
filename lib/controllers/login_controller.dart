import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/login/util/login_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  GlobalKey<FormState> loginformKey = new GlobalKey<FormState>();
  final FocusNode userFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isEmail = false;
  String errorEmail = LoginFont().userFieldError;
  bool isPassword = false;
  bool passwordVisible = true;
  var auth = FirebaseAuth.instance;
  final storage = GetStorage();

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }



  //google Login function
  googleLogin() async {
    print('tap');
    appCtrl.showLoading();
    update();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      appCtrl.hideLoading();
      update();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      User? user = (await _auth.signInWithCredential(credential)).user;
      appCtrl.hideLoading();
      update();
      saveData(googleSignInAccount.id);
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException catch (e) {
      appCtrl.hideLoading();
      update();
      throw e;
    }
  }

  //save data in shared pref
  saveData(userid) async {
    await storage.write('id', userid);

    update();
    Get.toNamed(routeName.dashboard);
  }

  //firebase login with email and password
  login() async {
    appCtrl.showLoading();
    update();
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      assert(user != null);
      assert(await user.user!.getIdToken() != null);
      final User? currentUser = await auth.currentUser;
      assert(user.user!.uid == currentUser!.uid);
      appCtrl.hideLoading();
      update();
      email.text = "";
      password.text = "";
      saveData(user.user!.uid);
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException catch (e) {
      appCtrl.hideLoading();
      update();
      if (e.code == 'wrong-password') {
        showToast('Incorrect Password');
      } else if (e.code == 'user-not-found') {
        showToast('Email is not Found');
      }
    } catch (e) {}
  }


  //show toast
  showToast(error) {
    Fluttertoast.showToast(msg: error);
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
