import 'package:flutter/material.dart';

import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final TextOverflow textOverFlow;
  final int? maxLines;

  const BigText(
    this.text, {
    super.key,
    this.size,
    this.color = AppColors.mainBlackColor,
    this.textOverFlow = TextOverflow.ellipsis,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        overflow: textOverFlow,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: size ?? Dimensions.bigTextHeight,
            color: color,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
