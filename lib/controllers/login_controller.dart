import 'package:fastkart/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

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

  //signIn
  signIn(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    if (loginformKey.currentState!.validate()) {
      Get.offAndToNamed(routeName.dashboard);
    }
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
      appCtrl.saveData(user.user!.uid);
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException catch (e) {
      appCtrl.hideLoading();
      update();
      if (e.code == 'wrong-password') {
        showToast('Incorrect Password');
      } else if (e.code == 'user-not-found') {
        showToast('Email is not Found');
      }
    } catch (e) {
      appCtrl.hideLoading();
      update();
    } finally {
      appCtrl.hideLoading();
      update();
    }
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
