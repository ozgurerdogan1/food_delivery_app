import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  late CartController _cartController;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int get totalItem => _cartController.totalItems;

/*   int _inCardItem = 0;
  int get inCardItem => _inCardItem + _quantity; */

  void initProduct(ProductModel product, CartController cartController) {
    _cartController = cartController;
    _quantity = 0;
    //_inCardItem = 0;
    var exist = false;
    exist = _cartController.existInCart(product);
    /*  if (exist) {
      _quantity = _cartController.getQuantity(product);
    } */

    print("exist: $exist");
    print("_quantity: $_quantity");
  }

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products ?? []);
      _isLoaded = true;
      update();
      // debugPrint(_popularProductList.toString());
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement & (_quantity < 20)) {
      _quantity++;
    } else if (!isIncrement & (_quantity > 0)) {
      _quantity--;
    }
    print("isIncrement: $isIncrement / quantity: $_quantity");

    if (isIncrement & (_quantity >= 20)) {
      print(">>>>>>>>>>>>>>>> $_quantity");
      !Get.isSnackbarOpen
          ? Get.snackbar(
              "Item count",
              "You can't add more",
              backgroundColor: AppColors.mainColor,
              colorText: Colors.white,
            )
          : null;
    } else if (!isIncrement & (_quantity <= 0)) {
      print("<<<<<<<<<<<<<< $_quantity");
      !Get.isSnackbarOpen
          ? Get.snackbar(
              "Item count",
              "You can't reduce more",
              backgroundColor: AppColors.mainColor,
              colorText: Colors.white,
            )
          : null;
    }

    update();
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      _cartController.addItem(product, _quantity);
      //_quantity = _cartController.getQuantity(product);
      update();
    } else {
      !Get.isSnackbarOpen
          ? Get.snackbar(
              "Item count",
              "You should at least add an item in cart",
              backgroundColor: AppColors.mainColor,
              colorText: Colors.white,
            )
          : null;
    }
  }
}
