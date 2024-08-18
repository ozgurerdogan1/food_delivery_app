import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  static RecommendedProductController get to => Get.find();

  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    print("recommended_product_controller: 1");
    Response response = await recommendedProductRepo.getRecommendedProductList();

    print("recommended_product_controller: 2");
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products ?? []);
      _isLoaded = true;
      update();

      print("recommended_product_controller: 3");
      debugPrint("recommendedProductList:=> $_recommendedProductList");
    }

    print("recommended_product_controller: 4");
  }
}
