import 'package:flutter/material.dart';

class BottomNavigationWidget{

  BottomNavigationBarItem bottomNavigationCard({color, String? text,  String? imageIcon, double height = 20,double width =20}){
    return BottomNavigationBarItem(
      backgroundColor: color,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5,top: 5,right: 10,left: 10),
        child: Image.asset(
          imageIcon!,
          height: height,
          width: width,
        ),
      ),
      label: text,
    );
  }

}