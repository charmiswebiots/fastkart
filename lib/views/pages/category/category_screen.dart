import 'package:fastkart/controllers/category_controller.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/category/categoryDataCard.dart';
import 'package:fastkart/views/pages/category/util/category_constants.dart';
import 'package:fastkart/views/pages/category/util/category_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class CategoryScreen extends StatefulWidget {
  /* */
  CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  var categoryCtrl = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (_) {
      return Scaffold(
        body: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      //search product textformfield layout
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppScreenUtil().screenHeight(15),
                            right: AppScreenUtil().screenHeight(15)),
                        child: CategoryWidget().textFieldLayout(
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
                            child: Image.asset(iconAssets.voice,fit: BoxFit.contain,color: appCtrl.appTheme.titleColor     ,height: AppScreenUtil().screenHeight(10),width: AppScreenUtil().screenWidth(10),),
                          ),
                          prefixIcon: Image.asset(iconAssets.textboxSearchIcon,color: appCtrl.appTheme.titleColor,),
                          text: CategoryFont().searchProduct,
                          borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                          hintColor: appCtrl.appTheme.contentColor,
                          fillcolor: appCtrl.appTheme.textBoxColor,
                        ),
                      ),
                      Space(0, 20),

                      //category and subcategory layout
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Category layout
                          CategoryWidget().categoryLayout(
                            context: context,
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: AppArray().categoryData.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => categoryCtrl.onTap(index),
                                  child: CategoryData(
                                    data: AppArray().categoryData[index],
                                    index: index,
                                    selectIndex: categoryCtrl.selectIndex,
                                    selectColor: appCtrl.appTheme.whiteColor,
                                    lastIndex:
                                        AppArray().categoryData.length - 1,
                                    listviewBGColor:
                                        appCtrl.appTheme.arrowSelectColor,
                                    primaryColor: appCtrl.appTheme.primary,
                                  ),
                                );
                              },
                            ),
                            listviewBGColor: appCtrl.appTheme.arrowSelectColor,
                          ),
                          CategoryWidget().subCaegoryLayout(
                              context: context,
                              child: Column(
                                children: [
                                  //Image layout
                                  CategoryWidget().imageBgLayout(
                                      context: context,
                                      buttonColor: appCtrl.appTheme.primary,
                                      titleColor: appCtrl.appTheme.bannerTitleColor,
                                      descriptionColor:
                                          appCtrl.appTheme.darkContentColor,
                                      buttonTextColor:
                                          appCtrl.appTheme.white),
                                  Space(0, 5),

                                  //subCategory list layout
                                  CategoryWidget().subCategoryList(
                                      context: context,
                                      data: categoryCtrl.subCategoryList,
                                      textColor: appCtrl.appTheme.darkGray,
                                      boxColor: appCtrl.appTheme.textBoxColor)
                                ],
                              ))
                        ],
                      ),
                      Space(0, 20)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
