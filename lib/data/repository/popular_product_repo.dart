import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    debugPrint("popular_product_repo 1");
    Response response = await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
    debugPrint("popular_product_repo 2");
    return response;
  }
}
