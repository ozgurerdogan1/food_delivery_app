import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/basketTotalItem.dart';
import 'package:food_delivery_app/widgets/big_text.dart.dart';
import 'package:food_delivery_app/widgets/expandable_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    ProductModel product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<RecommendedProductController>().initProduct(product, Get.find());

    String imageUrl = "${AppConstants.BASE_URL}${AppConstants.UPLOADS_URL}${product.img}";

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(onTap: () => Get.back(), child: AppIcon(icon: Icons.clear)),
                      AppIcon(icon: Icons.shopping_cart_outlined),
                    ],
                  ),
                ),
                GetBuilder<RecommendedProductController>(builder: (controller) {
                  return Positioned(
                    top: 3,
                    right: 7,
                    child: BasketItemCountWidget(controller.totalItem),
                  );
                }),
              ],
            ),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: AppColors.mainColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(imageUrl, fit: BoxFit.cover),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.height20),
                        topRight: Radius.circular(Dimensions.height20),
                      )),
                  child: BigText(
                    product.name ?? "null",
                    size: Dimensions.font26,
                  ),
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.height10,
                right: Dimensions.height10,
              ),
              child: ExpandableTextWidget(
                text: product.description ?? "null",
                textSize: Dimensions.font14,
                height: 1.5.h,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<RecommendedProductController>(builder: (controller) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.height20 * 2.5,
              right: Dimensions.height20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => controller.setQuantity(false),
                  child: AppIcon(
                    icon: Icons.remove,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.font20,
                  ),
                ),
                BigText(
                  "\$${product.price} X ${controller.quantity}",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                InkWell(
                  onTap: () => controller.setQuantity(true),
                  child: AppIcon(
                    icon: Icons.add,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.font20,
                  ),
                )
              ],
            ),
          ),
          Container(
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radius20)),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                        size: Dimensions.height20 * 1.2,
                      )),
                  Container(
                    padding: EdgeInsets.all(Dimensions.height20),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: InkWell(
                      onTap: () => controller.addItem(product),
                      child: BigText(
                        "\$${(product.price ?? 0) * controller.quantity} | Add to card",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )),
        ]);
      }),
    );
  }
}


