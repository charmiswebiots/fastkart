import 'package:fastkart/config.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {

  String? image;
  double? height;
  BackgroundImage({Key? key,this.image,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/height!,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image!,),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}