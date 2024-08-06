import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/big_text.dart.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

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
  final int _listLenght = 15;

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
        Container(
          height: 320,
          width: double.infinity,
          alignment: Alignment.center,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _listLenght,
            itemBuilder: (context, index) {
              return _buildPageItem(context, index);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: _listLenght,
          position: _currentPageIndex,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(11.0),
            activeSize: const Size(22.0, 11.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(BuildContext context, int index) {
    String asset = "assets/food${index % 4}.jpg";
    double containerHeight = 220;
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

    double currHeightCalc(int index, double currentPageValue, double scaleFactor, double containerHeight) {
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
      print("else");
      double currHeight = currHeightCalc(index, _currentPageValue, _scaleFactor, containerHeight);
      double currScale = _scaleFactor - (1 - scaleRatioY);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currHeight, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: containerHeight,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF69c5df),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(asset),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0),
                ),
              ]),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText("Kremalı Kek"),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  )),
                        ),
                        SizedBox(width: 10),
                        SmallText("4.5"),
                        SizedBox(width: 10),
                        SmallText("1287"),
                        SizedBox(width: 10),
                        SmallText("comments")
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(icon: Icons.circle, iconColor: AppColors.iconColor1, text: "Normal"),
                        IconAndTextWidget(icon: Icons.location_on, iconColor: AppColors.mainColor, text: "1.7km"),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded, iconColor: AppColors.iconColor2, text: "Normal"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
