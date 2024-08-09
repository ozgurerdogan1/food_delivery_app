import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/food_page_body.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("current height is : ${MediaQuery.of(context).size.height}");
    debugPrint("current width is : ${MediaQuery.of(context).size.width}");
    return Scaffold(
      body: Column(
        children: [
          //app bar
          Container(
            margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      "Türkiye",
                      color: AppColors.mainColor,
                    ),
                    //DropdownButton(items: items, onChanged: onChanged)
                    Row(
                      children: [
                        SmallText(
                          "Sakarya",
                        ),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Container(
                  height: Dimensions.height45,
                  width: Dimensions.height45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimensions.iconSize24,
                  ),
                ),
              ],
            ),
          ),

          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
