import 'package:fastkart/common/assets/index.dart';
import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: MediaQuery.of(context).size.width /4,
      child: Image.asset(
        imageAssets.logo,
      ),
    );
  }
}