import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/home_screen/util/home_widget.dart';
import 'package:flutter/material.dart';

class RecentBoughtList extends StatelessWidget {
  var containercolor;
  var bordercolor;
  String? title;
  var titlecolor;
  var list;
  var listcontainercolor;

  RecentBoughtList(
      {Key? key,
      this.containercolor,
      this.bordercolor,
      this.title,
      this.titlecolor,
      this.listcontainercolor,
      this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: AppScreenUtil().screenHeight(15),
              right: AppScreenUtil().screenHeight(15)),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().size(15),
              vertical: AppScreenUtil().size(18)),
          decoration: BoxDecoration(
              color: containercolor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppScreenUtil().borderRadius(40)),
                  topLeft: Radius.circular(AppScreenUtil().borderRadius(10)),
                  bottomRight:
                      Radius.circular(AppScreenUtil().borderRadius(10)),
                  bottomLeft:
                      Radius.circular(AppScreenUtil().borderRadius(10))),
              border: Border.all(color: bordercolor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //recent bought widget
              HomeWidget().recentlyBought(text: title, color: titlecolor),
              Space(0, 20),
              Container(
                height: 60,
                child: ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                    return Container(
                      margin: EdgeInsets.only(right: AppScreenUtil().size(15)),
                      padding: EdgeInsets.symmetric(
                          vertical: AppScreenUtil().size(12),
                          horizontal: AppScreenUtil().size(12)),
                      decoration: BoxDecoration(
                          color: listcontainercolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        list[index]['image'].toString(),
                        fit: BoxFit.fill,
                        height: AppScreenUtil().size(30),
                        width: AppScreenUtil().size(30),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(right: 15, child: Image.asset(imageAssets.corner))
      ],
    );
  }
}
