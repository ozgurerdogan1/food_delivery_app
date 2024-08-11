import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart.dart';
import 'package:food_delivery_app/widgets/expandable_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.popularFoodImgSize,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/food3.jpg"),
                ),
              ),
            ),
          ),
          Positioned(
            left: Dimensions.height20,
            right: Dimensions.height20,
            top: Dimensions.height40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - Dimensions.height20,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.height20,
                    right: Dimensions.height20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppColumn(
                        mainAxisAlignment: MainAxisAlignment.start, text: "Baklava Spacial"),
                    SizedBox(height: Dimensions.height20),
                    BigText("Introduce"),
                    SizedBox(height: Dimensions.height10),
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.only(bottom: Dimensions.height10),
                            //color: Colors.amber.shade100,
                            child: ExpandableTextWidget(
                                textAlign: TextAlign.justify,
                                textSize: Dimensions.font14,
                                color: AppColors.paraColor,
                                height: 1.5.h,
                                text:
                                    "Flutter ile uygulama geliştirmek, modern mobil ve web uygulamalarının hızlı ve etkili bir şekilde oluşturulmasını sağlar. Güçlü widget'lar ve özelleştirme seçenekleri sunar. Flutter ile uygulama geliştirmek, modern mobil ve web uygulamalarının hızlı ve etkili bir şekilde oluşturulmasını sağlar. Güçlü widget'lar ve özelleştirme seçenekleri sunar. Flutter ile uygulama geliştirmek, modern mobil ve web uygulamalarının hızlı ve etkili bir şekilde oluşturulmasını sağlar. Güçlü widget'lar ve özelleştirme seçenekleri sunar."),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: Dimensions.height10),
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.height20,
              right: Dimensions.height20),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.remove, color: AppColors.signColor),
                    SizedBox(width: Dimensions.height10),
                    BigText("0"),
                    SizedBox(width: Dimensions.height10),
                    const Icon(Icons.add, color: AppColors.signColor)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: const BigText(
                  "\$10 | Add to card",
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
