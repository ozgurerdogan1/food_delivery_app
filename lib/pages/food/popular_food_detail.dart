import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/basketTotalItem.dart';
import 'package:food_delivery_app/widgets/big_text.dart.dart';
import 'package:food_delivery_app/widgets/expandable_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    ProductModel product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find());

    String imageUrl = "${AppConstants.BASE_URL}${AppConstants.UPLOADS_URL}${product.img}";

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
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
          ),
          Positioned(
            left: Dimensions.height20,
            right: Dimensions.height20,
            top: Dimensions.height40,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Get.back(), child: AppIcon(icon: Icons.arrow_back_ios)),
                    AppIcon(icon: Icons.shopping_cart_outlined),
                  ],
                ),
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
                    AppColumn(
                      mainAxisAlignment: MainAxisAlignment.start,
                      text: product.name ?? "null",
                    ),
                    SizedBox(height: Dimensions.height20),
                    const BigText("Introduce"),
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
                                text: product.description ?? "null"),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: Dimensions.height10),
                  ],
                )),
          ),
          GetBuilder<PopularProductController>(builder: (controller) {
            return Positioned(
              top: 36.h,
              right: 19.h,
              child: BasketItemCountWidget(controller.totalItem),
            );
          }),
        ],
      ),
      bottomNavigationBar: Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              bottom: Dimensions.height10,
              left: Dimensions.height5,
              right: Dimensions.height5),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              )),
          child: GetBuilder<PopularProductController>(builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height10, horizontal: Dimensions.height10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () => controller.setQuantity(false),
                          icon: const Icon(Icons.remove, color: AppColors.signColor)),
                      BigText(controller.quantity.toString()),
                      IconButton(
                          onPressed: () => controller.setQuantity(true),
                          icon: const Icon(Icons.add, color: AppColors.signColor)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.addItem(product),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.height20, horizontal: Dimensions.height10),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: GestureDetector(
                      onTap: () => controller.addItem(product),
                      child: BigText(
                        "\$ ${(product.price ?? 0) * controller.quantity} | Add to card",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          })),
    );
  }
}
