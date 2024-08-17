import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/avarage_color_calc.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart.dart';
import 'package:food_delivery_app/widgets/expandable_text.dart';


class RecommendedFoodDetail extends StatelessWidget {
  final String imagePath;
  const RecommendedFoodDetail({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<Color>(
        future: AvarageColor.instance.getAvarageColor(imagePath), // Asenkron veri yükleme işlemi
        builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Verinin yüklenmesini beklerken gösterilecek widget
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Veri yüklenirken bir hata oluşursa gösterilecek widget
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            // Veri mevcut değilse gösterilecek widget
            return const Center(child: Text('Veri Yok'));
          } else {
            // Veri başarıyla yüklendiğinde gösterilecek widget
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 80,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIcon(icon: Icons.clear),
                      AppIcon(icon: Icons.shopping_cart_outlined),
                    ],
                  ),
                  pinned: true,
                  backgroundColor: snapshot.data,
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(imagePath, fit: BoxFit.cover),
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
                          "Dondurmalı Ekmek Kadayıfı",
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
                      text:
                          "Teknoloji hızla gelişiyor ve günlük yaşamımızda büyük değişiklikler yaratıyor. Bilgisayarlar, akıllı telefonlar ve diğer dijital cihazlar hayatımızın ayrılmaz bir parçası haline geldi. Bu cihazlar, bilgiye erişimimizi kolaylaştırıyor ve iletişimimizi daha hızlı ve etkili hale getiriyor. Ancak, teknolojinin bu hızlı ilerlemesi, güvenlik ve gizlilik endişelerini de beraberinde getiriyor. Bu nedenle, teknolojiyi kullanırken dikkatli olmak ve kişisel verilerimizi korumak önemlidir. Ayrıca, teknolojiye uyum sağlamak ve sürekli öğrenmek, bu değişimlerin getirdiği fırsatları en iyi şekilde değerlendirmek için gereklidir. Teknoloji hızla gelişiyor ve günlük yaşamımızda büyük değişiklikler yaratıyor. Bilgisayarlar, akıllı telefonlar ve diğer dijital cihazlar hayatımızın ayrılmaz bir parçası haline geldi. Bu cihazlar, bilgiye erişimimizi kolaylaştırıyor ve iletişimimizi daha hızlı ve etkili hale getiriyor. Ancak, teknolojinin bu hızlı ilerlemesi, güvenlik ve gizlilik endişelerini de beraberinde getiriyor. Bu nedenle, teknolojiyi kullanırken dikkatli olmak ve kişisel verilerimizi korumak önemlidir. Ayrıca, teknolojiye uyum sağlamak ve sürekli öğrenmek, bu değişimlerin getirdiği fırsatları en iyi şekilde değerlendirmek için gereklidir. Teknoloji hızla gelişiyor ve günlük yaşamımızda büyük değişiklikler yaratıyor. Bilgisayarlar, akıllı telefonlar ve diğer dijital cihazlar hayatımızın ayrılmaz bir parçası haline geldi. Bu cihazlar, bilgiye erişimimizi kolaylaştırıyor ve iletişimimizi daha hızlı ve etkili hale getiriyor. Ancak, teknolojinin bu hızlı ilerlemesi, güvenlik ve gizlilik endişelerini de beraberinde getiriyor. Bu nedenle, teknolojiyi kullanırken dikkatli olmak ve kişisel verilerimizi korumak önemlidir. Ayrıca, teknolojiye uyum sağlamak ve sürekli öğrenmek, bu değişimlerin getirdiği fırsatları en iyi şekilde değerlendirmek için gereklidir. Teknoloji hızla gelişiyor ve günlük yaşamımızda büyük değişiklikler yaratıyor. Bilgisayarlar, akıllı telefonlar ve diğer dijital cihazlar hayatımızın ayrılmaz bir parçası haline geldi. Bu cihazlar, bilgiye erişimimizi kolaylaştırıyor ve iletişimimizi daha hızlı ve etkili hale getiriyor. Ancak, teknolojinin bu hızlı ilerlemesi, güvenlik ve gizlilik endişelerini de beraberinde getiriyor. Bu nedenle, teknolojiyi kullanırken dikkatli olmak ve kişisel verilerimizi korumak önemlidir. Ayrıca, teknolojiye uyum sağlamak ve sürekli öğrenmek, bu değişimlerin getirdiği fırsatları en iyi şekilde değerlendirmek için gereklidir.",
                      textSize: Dimensions.font14,
                      height: 1.5.h,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
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
              AppIcon(
                icon: Icons.remove,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.font20,
              ),
              BigText(
                "\$${12.88} X ${0}",
                color: AppColors.mainBlackColor,
                size: Dimensions.font26,
              ),
              AppIcon(
                icon: Icons.add,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.font20,
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
                  child: const BigText(
                    "\$10 | Add to card",
                    color: Colors.white,
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
