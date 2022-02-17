import 'package:fastkart/config.dart';
import 'package:flutter/material.dart';

class SplashBGImage extends StatelessWidget {
  const SplashBGImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageAssets.splashBGImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
