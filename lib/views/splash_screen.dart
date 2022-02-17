import 'package:flutter/material.dart';

import 'package:fastkart/config.dart';
import 'package:fastkart/controllers/spalsh_controller.dart';


class SplashScreen extends StatelessWidget {
  var splashCtrl = Get.put(SplashController());

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/home.png",
                    width: 150,
                  ),
                ],
              ),
            ),
            const SizedBox(
              child: CircularProgressIndicator(),
              height: 20,
              width: 20,
            ),
           // const HSpace(20),
          ],
        ),
      ),
    );
  }
}
