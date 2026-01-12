import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';

class BaseService extends GetConnect implements GetxService {
  late Dio client;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    client = Dio(BaseOptions(
      contentType: Headers.jsonContentType,
    ));
    // Configure Dio to bypass proxy settings and disable certificate pinning
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      // Ignore proxy settings
      client.findProxy = (uri) => "DIRECT";

      // Disable SSL/TLS certificate validation
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      return client;
    };
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          // var token = storage.read('token');
          // if (token != null && token != '') {
          //   request.headers['Authorization'] = 'Bearer $token';
          // }
          return handler.next(request);
        },
        onError: (error, handler) async {
          // print(error);
          // if (error.response?.statusCode == 401) {
          //   await storage.remove('token');
          //   Get.offAllNamed('/login-screen');
          // }
          // if (error.response?.statusCode == 401) {
          //   await storage.remove('token');
          //   Get.offAllNamed('/login-screen');
          // }
          if (error.response == null) {
            // Get.offAll(() => NetworkErrorScreen(
            //       message: 'Network Error!! Please try after sometimes',
            //     ));
          } else if (error.response!.statusCode! >= 500) {
            // Get.offAll(() => NetworkErrorScreen(
            //       message: 'Server Error!! Please contact System Admin',
            //     ));
          }
          handler.next(error);
        },
      ),
    );
  }
}
