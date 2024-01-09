import 'package:fastkart/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  String? text;
  final getStorage = GetStorage();

  //onboarding read;
  onBoardingRead() async {
    await getStorage.write('isIntro', 'true');

    update();
    Get.toNamed(routeName.login);
  }

  //google Login function
  googleLogin() async {
    appCtrl.commonController.showLoading();
    update();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      appCtrl.commonController.hideLoading();
      update();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      (await _auth.signInWithCredential(credential)).user;
      appCtrl.commonController.hideLoading();
      update();
      saveData(googleSignInAccount.id);
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException catch (e) {
      appCtrl.commonController.hideLoading();
      update();
      showToast(e.toString());
    }
  }

  //show toast
  showToast(error) {
    Fluttertoast.showToast(msg: error);
  }

  //save data in shared pref
  saveData(userid) async {
    await getStorage.write('id', userid);
    await getStorage.write('id', userid);

    update();
    Get.toNamed(routeName.dashboard);
  }
}
