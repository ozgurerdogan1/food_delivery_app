import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class BasketItemCountWidget extends StatelessWidget {
  final int totalItem;
  const BasketItemCountWidget(
    this.totalItem, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: totalItem > 0,
      child: Transform.scale(
        scale: 1.2.h,
        child: Container(
          padding: EdgeInsets.all(4.h),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.mainColor,
          ),
          child: SmallText("$totalItem", color: Colors.white),
        ),
      ),
    );
  }
}