import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  BigText(
    this.text, {
    super.key,
    this.size = 0,
    this.color = AppColors.mainBlackColor,
    this.textOverFlow = TextOverflow.ellipsis,
  });

  final Color? color;
  final String text;
  double? size;
  final TextOverflow textOverFlow;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: textOverFlow,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: size == 0 ? Dimensions.bigTextHeight : size,
            color: color,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
