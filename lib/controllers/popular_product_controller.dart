import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  static PopularProductController get to => Get.find();

  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    print("popular_product_controller: 1");
    Response response = await popularProductRepo.getPopularProductList();

    print("popular_product_controller: 2");
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products ?? []);
      _isLoaded = true;
      update();

      print("popular_product_controller: 3");
      debugPrint(_popularProductList.toString());
    }

    print("popular_product_controller: 4");
  }
}
