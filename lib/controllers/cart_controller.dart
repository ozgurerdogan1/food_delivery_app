import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/repository/cart_repo.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    if (product.id == null) return;

    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        print(
            "updating item to do cart id: ${product.id}, quantity: ${value.quantity! + quantity}");
        return CartModel(
          id: value.id,
          img: value.img,
          name: value.name,
          price: value.price,
          isExist: true,
          quantity: (value.quantity ?? 0) + quantity,
          time: DateTime.now().toString(),
        );
      });
    } else {
      _items.putIfAbsent(product.id!, () {
        print("addind item to do cart id: ${product.id}, quantity: $quantity");
        return CartModel(
          id: product.id,
          img: product.img,
          name: product.name,
          price: product.price,
          isExist: true,
          quantity: quantity,
          time: DateTime.now().toString(),
        );
      });
    }

    print("lenght of the item is ${_items.length}");
    //print(_items);
  }

  existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  getQuantity(ProductModel product) {
    return _items[product.id]?.quantity;
  }

  int get totalItems {
    int totalQuantity = 0;

    _items.forEach((key, value) {
      totalQuantity += value.quantity ?? 0;
    });

    return totalQuantity;
  }
}
