import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/big_text.dart.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  late PageController _pageController;

  final double _scaleFactor = 0.8;
  double _currentPageValue = 0.0;
  int _currentPageIndex = 0;
  int _lastPageIndex = 0;

  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: _scaleFactor);
    _pageController.addListener(() {
      _pageValueListener();
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageValueListener();
    super.dispose();
  }

  void _pageValueListener() {
    _currentPageValue = _pageController.page!;
    _currentPageIndex = _pageController.page?.round() ?? _lastPageIndex;
    _lastPageIndex = _currentPageIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(
            init: PopularProductController(popularProductRepo: Get.find()),
            builder: (popularProducts) {
              late ProductModel popularProduct;
              return !popularProducts.isLoaded
                  ? const CircularProgressIndicator(
                      color: AppColors.mainColor,
                    )
                  : Container(
                      height: Dimensions.pageView,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: popularProducts.popularProductList.length,
                        itemBuilder: (context, index) {
                          popularProduct = popularProducts.popularProductList[index];
                          return _buildPageItem(
                            context,
                            index,
                            popularProduct,
                          );
                        },
                      ),
                    );
            }),
        // dots indicator
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageIndex,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: Dimensions.dotsSize,
              activeSize: Dimensions.dotsActiveSize,
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius5),
              ),
            ),
          );
        }),
        SizedBox(height: Dimensions.height10),
        // recommended food pairing text
        Container(
          margin: EdgeInsets.only(left: Dimensions.height30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText("Recommended"),
              SizedBox(width: Dimensions.height10),
              Container(
                  margin: EdgeInsets.only(bottom: 3.h),
                  child: const BigText(".", color: Colors.black26)),
              SizedBox(width: Dimensions.height10),
              Container(
                  margin: EdgeInsets.only(bottom: 2.h), child: const SmallText("Food pairing")),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height10),
        //recommended food list
        GetBuilder<RecommendedProductController>(builder: (recommendedProducts) {
          late ProductModel recommendedProduct;
          return !recommendedProducts.isLoaded
              ? const CircularProgressIndicator(
                  color: AppColors.mainColor,
                )
              : Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.height10,
                    right: Dimensions.height10,
                  ),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recommendedProducts.recommendedProductList.length,
                    itemBuilder: (context, index) {
                      recommendedProduct = recommendedProducts.recommendedProductList[index];

                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getRecommendedFood(index));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: Dimensions.height10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // image section

                              Container(
                                width: Dimensions.listViewImgSize,
                                height: Dimensions.listViewImgSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${AppConstants.BASE_URL}${AppConstants.UPLOADS_URL}${recommendedProduct.img ?? ""}"),
                                  ),
                                ),
                              ),

                              // text container
                              Expanded(
                                child: Container(
                                  height: Dimensions.listViewTextContSize,
                                  padding: EdgeInsets.only(
                                    left: Dimensions.height10,
                                    right: Dimensions.height10,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(Dimensions.radius20),
                                        bottomRight: Radius.circular(Dimensions.radius20),
                                      ),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //name
                                      BigText(
                                        recommendedProduct.name ?? "null",
                                        maxLines: 1,
                                        textOverFlow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: Dimensions.height10),
                                      //description
                                      SmallText(
                                        recommendedProduct.description ?? "null",
                                        maxLines: 1,
                                        textOverFlow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: Dimensions.height10),
                                      const Row(
                                        children: [
                                          IconAndTextWidget(
                                              icon: Icons.circle,
                                              iconColor: AppColors.iconColor1,
                                              text: "Normal"),
                                          IconAndTextWidget(
                                              icon: Icons.location_on,
                                              iconColor: AppColors.mainColor,
                                              text: "1.7km"),
                                          IconAndTextWidget(
                                              icon: Icons.access_time_rounded,
                                              iconColor: AppColors.iconColor2,
                                              text: "Normal"),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
        })
      ],
    );
  }

  Widget _buildPageItem(BuildContext context, int index, ProductModel popularProduct) {
    //String asset = "assets/food${index % 4}.jpg";
    double containerHeight = _height;
    double scaleRatioY = 1;
    Matrix4 matrix = Matrix4.identity();

    // currScale; index ile curentPageValue arasındaki farkın açılıp kapanmasına
    //ters orantılı olarak 1 ile 0.8 arasında bir değer alır

    // index değeri ile currentPageValue değerleri arasındaki fark BÜYÜDÜKÇE
    //en öndeki ekran KÜÇÜLÜR

    // index değeri ile currentPageValue değerleri arasındaki fark KÜÇÜLDÜKÇE
    //en öndeki ekran BÜYÜR

    double currScaleCalc(int index, double currentPageValue, double scaleFactor) {
      return scaleRatioY - (currentPageValue - index).abs() * (1 - scaleFactor);
    }

    double currHeightCalc(
        int index, double currentPageValue, double scaleFactor, double containerHeight) {
      double currScale = currScaleCalc(index, currentPageValue, scaleFactor);
      return (scaleRatioY - currScale).abs() * containerHeight / 1.5;
    }

    if (index == _currentPageValue.floor() ||
        index == _currentPageValue.floor() + 1 ||
        index == _currentPageValue.floor() - 1) {
      double currScale = currScaleCalc(index, _currentPageValue, _scaleFactor);
      double currHeight = currHeightCalc(index, _currentPageValue, _scaleFactor, containerHeight);

      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currHeight, 0);
    } else {
      double currHeight = currHeightCalc(index, _currentPageValue, _scaleFactor, containerHeight);
      double currScale = _scaleFactor - (1 - scaleRatioY);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currHeight, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(
              RouteHelper.getPopularFood(index),
            ),
            child: Container(
              height: containerHeight,
              margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: const Color(0xFF69c5df),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    //image: AssetImage(asset),
                    image: NetworkImage(
                        "${AppConstants.BASE_URL}${AppConstants.UPLOADS_URL}${popularProduct.img ?? ""}"),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.height30,
                  right: Dimensions.height30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFe8e8e8),
                      blurRadius: Dimensions.radius5,
                      offset: Offset(0, Dimensions.width5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(Dimensions.heightN5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(Dimensions.height5, 0),
                    ),
                  ]),
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      left: Dimensions.height15,
                      right: Dimensions.height15,
                      bottom: Dimensions.height15),
                  child: AppColumn(text: popularProduct.name ?? "null")),
            ),
          ),
        ],
      ),
    );
  }
}
