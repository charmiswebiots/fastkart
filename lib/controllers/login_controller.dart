import 'package:fastkart/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  GlobalKey<FormState> loginformKey =  GlobalKey<FormState>();
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
    appCtrl.commonController.showLoading();
    update();
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      await user.user!.getIdToken();
      final User? currentUser =  auth.currentUser;
      assert(user.user!.uid == currentUser!.uid);
      await storage.write('id', user.user!.uid);
      appCtrl.commonController.hideLoading();
      update();
      email.text = "";
      password.text = "";
      appCtrl.saveData(user.user!.uid);
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException catch (e) {
      appCtrl.commonController.hideLoading();
      update();
      if (e.code == 'wrong-password') {
        showToast('Incorrect Password');
      } else if (e.code == 'user-not-found') {
        showToast('Email is not Found');
      }
    } catch (e) {
      appCtrl.commonController.hideLoading();
      update();
    } finally {
      appCtrl.commonController.hideLoading();
      update();
    }
  }

  //show toast
  showToast(error) {
    Fluttertoast.showToast(msg: error);
  }

}
