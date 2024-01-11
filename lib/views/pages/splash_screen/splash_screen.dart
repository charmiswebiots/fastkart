
import 'package:fastkart/views/pages/splash_screen/util/splash_widget.dart';

import 'package:fastkart/config.dart';
import 'package:fastkart/controllers/spalsh_controller.dart';

class SplashScreen extends StatefulWidget {

 const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashCtrl = Get.put(SplashController());
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  @override
  void initState() {
    // TODO: implement initState
 //  getTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (cntrl) {
        return PopScope(
          canPop:false,
          child: Scaffold(
            body: GetBuilder<SplashController>(builder: (_) => Stack(
              children:  [
                //Back Image Layout
                SplashWidget().backgroundImage(image: imageAssets.splashBGImage,height: 1.6,context: context),
                //splash logo Layout
                appCtrl.isTheme ?SplashWidget().splashLogo(image: imageAssets.themeLogo,width: 3.5,context: context) :SplashWidget().splashLogo(image: imageAssets.logo,width: 4,context: context)

              ],
            ),),
          ),
        );
      }
    );
  }
}