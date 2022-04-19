import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:flutter/material.dart';

class ShopByCategory extends StatelessWidget {
  const ShopByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: AppArray().categoryData.length,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: AppScreenUtil().screenHeight(50),
                width: AppScreenUtil().screenWidth(65),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppArray().categoryData[index].color,
                        width: 2),
                    color: AppArray()
                        .categoryData[index]
                        .containercolor,
                    borderRadius: BorderRadius.circular(15)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppScreenUtil().size(20),
                    left: AppScreenUtil().size(0)),
                child: Image.asset(
                  AppArray().categoryData[index].image,
                ),
              ),
            ],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2),
        ),
      ),
    );
  }
}
