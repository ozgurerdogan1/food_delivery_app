import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final double? iconSize;
  final double? textSize;
  final Color? textColor;
  const IconAndTextWidget({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor = AppColors.mainColor,
    this.textColor = AppColors.textColor,
    this.iconSize,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: textColor,
          ),
        )
      ],
    );
  }
}
