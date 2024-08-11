import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

// ignore: must_be_immutable
class AppIcon extends StatelessWidget {
  final IconData icon;
  Color backgroundColor;
  final Color iconColor;
  double? iconSize;
  double? size;
  AppIcon({
    super.key,
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.size,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    size ??= Dimensions.height40;
    iconSize ??= Dimensions.iconSize16;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size! / 2),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
