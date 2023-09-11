import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final double? height;

  const SmallText(
    this.text, {
    super.key,
    this.color = AppColors.textColor,
    this.size = 12,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: size,
            color: color,
            fontWeight: FontWeight.w400,
            height: height,
          ),
        ));
  }
}
