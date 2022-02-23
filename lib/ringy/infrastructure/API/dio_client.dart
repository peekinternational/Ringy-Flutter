import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ringy_flutter/ringy/infrastructure/API/api_content.dart';
import 'logging.dart';

class DioClient
 {

   static DioClient _instance = DioClient._();
   DioClient._();

   static DioClient get instance => _instance;

   Dio getDioClient(){
     final Dio _dio = Dio();
     onHTTPCreate(_dio);
     return _dio;
   }

    static void onHTTPCreate(Dio dio){
     dio.options = BaseOptions(
        baseUrl: APIContent.MainUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      dio.interceptors.add(Logging());
    }
 }
