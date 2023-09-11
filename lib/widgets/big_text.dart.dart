import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final TextOverflow textOverFlow;
  const BigText(
    this.text, {
    super.key,
    this.color = AppColors.mainBlackColor,
    this.textOverFlow = TextOverflow.ellipsis,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: textOverFlow,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: size,
            color: color,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
