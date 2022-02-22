import 'package:flutter/material.dart';

class imageLayout extends StatelessWidget {

  String? image;
  double? height;
  double? weight;
  BoxFit? fit;
  imageLayout({Key? key,this.image,this.height,this.weight,this.fit}) : super(key: key);

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