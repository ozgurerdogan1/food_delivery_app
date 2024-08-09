import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final double? height;
  final TextAlign? textAlign;

  const SmallText(
    this.text, {
    super.key,
    this.size = 0,
    this.color = AppColors.textColor,
    this.textAlign,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: size == 0 ? Dimensions.smallTextHeight : size,
            color: color,
            fontWeight: FontWeight.w400,
            height: height ?? 1.2.h,
          ),
        ));
  }
}
