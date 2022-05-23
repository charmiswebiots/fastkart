import '../config.dart';
import 'dart:math' as math;

class TransformLayout extends StatelessWidget {
  final Widget? child;
  const TransformLayout({Key? key,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Transform(
          alignment: Alignment.center,
          transform: appCtrl.languageVal == "ar" || appCtrl.isRTL
              ? Matrix4.rotationY(math.pi)
              : Matrix4.rotationX(math.pi),
          child: child,
        );
      }
    );
  }
}
