import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class Dimensions {
  // static double screenHeight = Get.context!.height;
//  static double screenWidth = Get.context!.width;

  static double pageView = 320.h; // screenHeight / 2.51; // 805/320
  static double pageViewContainer = 220.h; //screenHeight / 3.65; // 805/200
  static double pageViewTextContainer = 145.h; //screenHeight / 6.70; // 805/120

  static double width5 = 5.w;

  static double heightN5 = -5.h;
  static double height5 = 5.h;
  static double height10 = 10.h;
  static double height15 = 15.h;
  static double height20 = 20.h;
  static double height30 = 30.h;
  static double height45 = 45.h;

  static double radius5 = 5.r;
  static double radius15 = 15.r;
  static double radius20 = 20.r;
  static double radius30 = 30.r;

  static double smallTextHeight = 12.h;
  static double bigTextHeight = 20.h;

  static Size dotsActiveSize = Size(22.0.w, 11.0.h);
  static Size dotsSize = Size.square(11.0.h);

  static double iconSize24 = 24.h;

  static double listViewImgSize = 120.h;
  static double listViewTextContSize = 100.h;
}
