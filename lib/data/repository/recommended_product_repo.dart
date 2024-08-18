import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    debugPrint("recommended_product_repo 1");
    Response response = await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
    debugPrint("recommended_product_repo 2");
    return response;
  }
}
