import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/big_text.dart.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.text,
  });

  final MainAxisAlignment mainAxisAlignment;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.max,
      children: [
        BigText(text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: Dimensions.height15,
                      )),
            ),
            SizedBox(width: Dimensions.height10),
            const SmallText("4.5"),
            SizedBox(width: Dimensions.height10),
            const SmallText("1287"),
            SizedBox(width: Dimensions.height10),
            const SmallText("comments")
          ],
        ),
        SizedBox(height: Dimensions.height20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(icon: Icons.circle, iconColor: AppColors.iconColor1, text: "Normal"),
            IconAndTextWidget(icon: Icons.location_on, iconColor: AppColors.mainColor, text: "1.7km"),
            IconAndTextWidget(icon: Icons.access_time_rounded, iconColor: AppColors.iconColor2, text: "Normal"),
          ],
        )
      ],
    );
  }
}
