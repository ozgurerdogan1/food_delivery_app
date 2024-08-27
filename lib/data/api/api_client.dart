import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  late String appBaseUrl;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    token = AppConstants.TOKEN;
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 300);
    _mainHeaders = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);

      return response;
    } on Exception catch (e) {
      debugPrint("error: $e");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
