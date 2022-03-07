import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/models/banner_model.dart';
import 'package:fastkart/models/category_model.dart';
import 'package:flutter/material.dart';

class AppArray {
  //recent bought list
  var recentBoughtList = [
    {
      'image': imageAssets.recentBought1,
    },
    {
      'image': imageAssets.recentBought2,
    },
    {
      'image': imageAssets.recentBought3,
    },
    {
      'image': imageAssets.recentBought4,
    },
    {
      'image': imageAssets.recentBought5,
    },
  ];

  //category list with model
  var categoryData = <CategoryModel>[
    CategoryModel(
      "Oils,Refined & Ghee",
      Color(0xFFE5FDFA),
      imageAssets.category1,
      Color(0xFFE0FFFB),
    ),
    CategoryModel(
      "Rice, Flour & Grains",
      Color(0xFFFFF9D8),
      imageAssets.category2,
      Color(0xFFFFF6C3),
    ),
    CategoryModel(
      "Food Cupboard",
      Color(0xFFFFF2EC),
      imageAssets.category3,
      Color(0xFFFFEAE0),
    ),
    CategoryModel(
      "Fresh Fruits& Vegetables",
      Color(0xFFFFF2F2),
      imageAssets.category4,
      Color(0xFFFFFE5E5),
    ),
    CategoryModel(
      "Drinks& Beverages",
      Color(0xFFFCF1FF),
      imageAssets.category5,
      Color(0xFFFAEAFF),
    ),
    CategoryModel(
      "Instant Mixes",
      Color(0xFFE8FFFC),
      imageAssets.category6,
      Color(0xFFDBFFFA),
    ),
    CategoryModel(
      "Ready to Eat",
      Color(0xFFFFF9D8),
      imageAssets.category7,
      Color(0xFFFFF6C3),
    ),
    CategoryModel(
      "Dals & Pulses",
      Color(0xFFFFF8F0),
      imageAssets.category8,
      Color(0xFFFFF1E1),
    )
  ];

  //banner list
  var bannerList = <BannerModel>[
    BannerModel('Farm Fresh Vegies', 'Get instant delivery',
        imageAssets.banner1, 'Shop Now'),
    BannerModel('Farm Fresh Vegies', 'Get instant delivery',
        imageAssets.banner2, 'Shop Now'),
  ];

  //offer lists
  var offerList = [
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price' : '25.00',
      'discount' :'50% off',
      'image': imageAssets.offer1
    },{
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price' : '25.00',
      'discount' :'50% off',
      'image': imageAssets.offer1
    },{
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price' : '25.00',
      'discount' :'50% off',
      'image': imageAssets.offer1
    }
  ];

  //
  //lower price lists
  var lowerPriceList = [
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price' : '25.00',
      'image': imageAssets.lowestPrice1
    },{
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price' : '25.00',
      'image': imageAssets.lowestPrice2
    },{
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price' : '25.00',
      'image': imageAssets.lowestPrice3
    },{
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price' : '25.00',
      'image': imageAssets.lowestPrice4
    },{
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price' : '25.00',
      'image': imageAssets.lowestPrice5
    }
  ];
}
