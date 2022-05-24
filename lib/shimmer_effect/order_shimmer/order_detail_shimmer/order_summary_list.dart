import 'package:flutter/cupertino.dart';

import '../../../config.dart';

class OrderSummaryList extends StatelessWidget {
  const OrderSummaryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return SizedBox(
        height: AppScreenUtil().screenHeight(170),
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CommonShimmerWidget().commonShimmer(
                            color: appCtrl.appTheme.lightGray.withOpacity(.5),
                            borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                            borderRadius: 2,
                            height: 25,
                            width: 25,child: Center(child: Text('0',style: TextStyle(color: appCtrl.appTheme.lightGray),))),
                        const Space(10, 0),
                        Icon(CupertinoIcons.multiply,color: appCtrl.appTheme.lightGray,),
                        const Space(10, 0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonShimmerWidget().commonShimmer(
                                color: appCtrl.appTheme.lightGray.withOpacity(.5),
                                borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                                borderRadius: 2,
                                height: 10,
                                width: 100),
                            const Space(0, 5),
                            CommonShimmerWidget().commonShimmer(
                                color: appCtrl.appTheme.lightGray.withOpacity(.5),
                                borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                                borderRadius: 2,
                                height: 10,
                                width: 80),
                          ],
                        ),
                      ],
                    ),
                    CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.lightGray.withOpacity(.5),
                        borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                        borderRadius: 2,
                        height: 10,
                        width: 80),
                  ],
                ),
                if(index != 2)
                Column(
                  children: [
                    const Space(0, 10),
                    Divider(color: appCtrl.appTheme.lightGray,),
                    const Space(0, 10),
                  ],
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
