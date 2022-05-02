import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/models/banner_model.dart';
import 'package:fastkart/models/category_model.dart';
import 'package:fastkart/models/coupon_model.dart';
import 'package:fastkart/views/pages/offers/util/offer_constants.dart';
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
      1,
      "Oils,Refined & Ghee",
      Color(0xFFE5FDFA),
      imageAssets.category1,
      Color(0xFFE0FFFB),
    ),
    CategoryModel(
      2,
      "Rice, Flour & Grains",
      Color(0xFFFFF9D8),
      imageAssets.category2,
      Color(0xFFFFF6C3),
    ),
    CategoryModel(
      3,
      "Food \nCupboard",
      Color(0xFFFFF2EC),
      imageAssets.category3,
      Color(0xFFFFEAE0),
    ),
    CategoryModel(
      4,
      "Fresh Fruits & Vegetables",
      Color(0xFFFFF2F2),
      imageAssets.category4,
      Color(0xFFFFFE5E5),
    ),
    CategoryModel(
      5,
      "Drinks & Beverages",
      Color(0xFFFCF1FF),
      imageAssets.category5,
      Color(0xFFFAEAFF),
    ),
    CategoryModel(
      6,
      "Instant \nMixes",
      Color(0xFFE8FFFC),
      imageAssets.category6,
      Color(0xFFDBFFFA),
    ),
    CategoryModel(
      7,
      "Ready to \nEat",
      Color(0xFFFFF9D8),
      imageAssets.category7,
      Color(0xFFFFF6C3),
    ),
    CategoryModel(
      8,
      "Dals & \nPulses",
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
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.offer1,
      'quantity': 0
    },
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.offer2,
      'quantity': 0
    },
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.offer3,
      'quantity': 0
    }
  ];

  //
  //lower price lists
  var lowerPriceList = [
    {
      'name': 'Assorted \nCapsicum Combo',
      'description': '500g',
      'price': '25.00',
      'image': imageAssets.lowestPrice1
    },
    {
      'name': 'Assorted \nCapsicum Combo',
      'description': '500g',
      'price': '25.00',
      'image': imageAssets.lowestPrice2
    },
    {
      'name': 'Assorted \nCapsicum Combo',
      'description': '500g',
      'price': '25.00',
      'image': imageAssets.lowestPrice3
    },
    {
      'name': 'Assorted \nCapsicum Combo',
      'description': '500g',
      'price': '25.00',
      'image': imageAssets.everyDay1
    },
    {
      'name': 'Assorted \nCapsicum Combo',
      'description': '500g',
      'price': '25.00',
      'image': imageAssets.everyDay2
    }
  ];

  //everyday Essential lists
  var everyDayEssentialList = [
    {
      'name': 'Assorted \nCapsicum Combo',
      'description': '500g',
      'price': '25.00',
      'image': imageAssets.everyDay1
    },
    {
      'name': 'Assorted \nCapsicum Combo',
      'description': '500g',
      'price': '25.00',
      'image': imageAssets.everyDay2
    },
    {
      'name': 'Assorted \nCapsicum Combo',
      'description': '500g',
      'price': '25.00',
      'image': imageAssets.everyDay3
    },
    {
      'name': 'Assorted \nCapsicum Combo',
      'description': '500g',
      'price': '25.00',
      'image': imageAssets.lowestPrice1
    },
    {
      'name': 'Assorted \nCapsicum Combo',
      'description': '500g',
      'price': '25.00',
      'image': imageAssets.lowestPrice2
    }
  ];

  //coupon List
  var couponData = <CouponModel>[
    CouponModel("50% OFF", 'UPTO \$20.00', imageAssets.coupon1,
        Color(0xFFFFF4F3), imageAssets.offerBG1, imageAssets.themeOfferBG1),
    CouponModel("50% OFF", 'UPTO \$20.00', imageAssets.coupon2,
        Color(0xFFFFFFFF), imageAssets.offerBG2, imageAssets.themeOfferBG2),
    CouponModel("50% OFF", 'UPTO \$20.00', imageAssets.coupon3,
        Color(0xFFFFFDE9), imageAssets.offerBG3, imageAssets.themeOfferBG3),
  ];

  //drawer list
  final drawerList = [
    {
      "title": "Home",
      "icon": iconAssets.drawerHome,
    },
    {
      "title": "Shop By Category",
      "icon": iconAssets.category,
    },
    {
      "title": "Orders",
      "icon": iconAssets.orders,
    },
    {
      "title": "Your Wishlist",
      "icon": iconAssets.simpleheart,
    },
    {
      "title": "Language",
      "icon": iconAssets.language,
    },
    {
      "title": "Your Account",
      "icon": iconAssets.profile,
    },
    {
      "title": "Notification",
      "icon": iconAssets.notification,
    },
    {
      "title": "Settings",
      "icon": iconAssets.setting,
    },
    {
      "title": "Theme",
      "icon": iconAssets.darkTheme,
    },
  ];

  //sub category list with model
  var subCategoryData = [
    {"title": "Vegetables", "image": imageAssets.subCategory1, 'categoryId': 1},
    {"title": "Fruits", "image": imageAssets.subCategory2, 'categoryId': 1},
    {"title": "Herbs", "image": imageAssets.subCategory3, 'categoryId': 1},
    {"title": "Herbs", "image": imageAssets.subCategory4, 'categoryId': 1},
    {"title": "Sprouts", "image": imageAssets.subCategory5, 'categoryId': 1},
    {"title": "Flowers", "image": imageAssets.subCategory6, 'categoryId': 1},
    {
      "title": "Exotic Fruits",
      "image": imageAssets.subCategory7,
      'categoryId': 1
    },
    {"title": "Organic", "image": imageAssets.subCategory8, 'categoryId': 1},
    {"title": "Cut Fruits", "image": imageAssets.subCategory9, 'categoryId': 1},
    {"title": "Bouquets", "image": imageAssets.subCategory10, 'categoryId': 1},
    {"title": "Fruits", "image": imageAssets.subCategory2, 'categoryId': 1},
    {"title": "Herbs", "image": imageAssets.subCategory3, 'categoryId': 1},
    {"title": "Sprouts", "image": imageAssets.subCategory5, 'categoryId': 0},
    {"title": "Herbs", "image": imageAssets.subCategory4, 'categoryId': 0},
    {"title": "Flowers", "image": imageAssets.subCategory6, 'categoryId': 0},
    {"title": "Organic", "image": imageAssets.subCategory8, 'categoryId': 2},
    {"title": "Vegetables", "image": imageAssets.subCategory1, 'categoryId': 2},
    {"title": "Bouquets", "image": imageAssets.subCategory8, 'categoryId': 4},
  ];

  //recent search list
  final recentSearch = [
    {'title': 'Vegetables'},
    {'title': 'Fruits'},
    {'title': 'Beauty'},
    {
      'title': 'Fruits',
    }
  ];

  //shop category list
  final shopCategoryList = [
    {
      'title': 'Fresh Vegetables',
      'id': 1,
    },
    {
      'title': 'Herbs & Seasonings',
      'id': 2,
    },
    {
      'title': 'Fresh Fruit',
      'id': 3,
    },
    {
      'title': 'Drinks& Beverages',
      'id': 4,
    },
    {
      'title': 'Instant Mixes',
      'id': 5,
    },
  ];

  //offer list
  final myOfferList = [
    {
      'discount': "50",
      'title': "on your first order",
      "des": "on order above ${OfferFont().dollar}250.00",
      "code": "SCD450"
    },
    {
      'discount': "25",
      'title': "on your first order",
      "des": "hdfc  credit card",
      "code": "SCD450"
    },
    {
      'discount': "40",
      'title': "on your first order",
      "des": "on order above ${OfferFont().dollar}250.00",
      "code": "SCD450"
    },
    {
      'discount': "30",
      'title': "on your first order",
      "des": "on order above ${OfferFont().dollar}250.00",
      "code": "SCD450"
    },
    {
      'discount': "15",
      'title': "on your first order",
      "des": "on order above ${OfferFont().dollar}250.00",
      "code": "SCD450"
    },
    {
      'discount': "10",
      'title': "on your first order",
      "des": "on order above ${OfferFont().dollar}250.00",
      "code": "SCD450"
    },
  ];

  //shop lists
  var shopList = [
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.offer1,
      'quantity': 0,
      'categoryId': 1
    },
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.offer2,
      'quantity': 0,
      'categoryId': 1
    },
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.offer3,
      'quantity': 0,
      'categoryId': 1
    },
    {
      'name': '100% Organic, Best Quality,\nBest price',
      'image': imageAssets.shopListImage,
      'categoryId': 1
    },
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.lowestPrice3,
      'quantity': 0,
      'categoryId': 2
    },
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.lowestPrice2,
      'quantity': 0,
      'categoryId': 2
    },
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.everyDay3,
      'quantity': 0,
      'categoryId': 3
    },
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.everyDay1,
      'quantity': 0,
      'categoryId': 3
    },
    {
      'name': 'Assorted Capsicum Combo',
      'description': '500g',
      'price': '25.00',
      'discount': '50% off',
      'image': imageAssets.offer3,
      'quantity': 0,
      'categoryId': 4
    },
  ];

  //package size
  var packageSizeList = [
    {"title": "100g-500g"},
    {"title": "500g-1kg"},
    {"title": "1kg-1.5kg"},
    {"title": "1.5kg-2kg"},
  ];

  //quantity list
  var quantityList = [
    {"title": "500 g / \$24.00"},
    {"title": "700 g / \$34.00"},
    {"title": "100 g / \$48.00"},
    {"title": "1.5 Kg / \$70.00"},
    {"title": "2 Kg / \$100.00"},
    {"title": "5 Kg / \$150.00"},
  ];

  //deliveryTime list
  var deliveryTimeList = [
    {"title": "7 Am"},
    {"title": "9 Am"},
    {"title": "11 Am"},
    {"title": "5 Pm"},
    {"title": "7 Pm"},
    {"title": "9 Pm"},
  ];

  var detailList = [

      {
        "title": "Product Details",
        'desc':
            'Refillable, Reusable, High Quality Glass Roll on Bottles with Silver cap For Essential Oil Blends DIY Perfume Cosmetics Beauty Products Ideal',
        'isShow' :false
      },
      {
        "title": "Manufacturer Details",
        'desc':
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla ullam iste aliquam, commodi voluptates doloremque. Autem exercitationem vel eaque in odit expedita non blanditiis, perspiciatis maiores cum tempora quo distinctio?',
        'isShow' :false
      },
      {
        "title": "Product Disclaimer",
        'desc':
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla ullam iste aliquam, commodi voluptates doloremque. Autem exercitationem vel eaque in odit expedita non blanditiis, perspiciatis maiores cum tempora quo distinctio?',
        'isShow' :false
      },
      {
        "title": "Features & details",
        'desc':
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla ullam iste aliquam, commodi voluptates doloremque. Autem exercitationem vel eaque in odit expedita non blanditiis, perspiciatis maiores cum tempora quo distinctio?',
        'isShow' :false
      },

  ];

  var reviewList =[{
    'name':'Andrea Joanne',
    'rating':4,
    'desc':"It's a really cute skirt! I didn't expect to feel so good in a polyester material. The print is slightly"
  },{
    'name':'Andrea Joanne',
    'rating':4,
    'desc':"It's a really cute skirt! I didn't expect to feel so good in a polyester material. The print is slightly"
  },{
    'name':'Andrea Joanne',
    'rating':4,
    'desc':"It's a really cute skirt! I didn't expect to feel so good in a polyester material. The print is slightly"
  },{
    'name':'Andrea Joanne',
    'rating':4,
    'desc':"It's a really cute skirt! I didn't expect to feel so good in a polyester material. The print is slightly"
  },];
}
