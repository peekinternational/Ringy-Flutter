
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/domain/i_chat_facade.dart';

class ApiDataSource implements IChatFacade {
  @override
  Future<Either<String, List<ChatModel>>> getChats() async {
    try {
      Dio dio =  Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      Response response;
      response = await dio.get("https://ringy.jp:22000/GetRingo2oChat/6152f067d8eda876c8d49cbe/61aef7d8d5d2971bb4c8b890/100/5d4c07fb030f5d0600bf5c03/0");

      Iterable  jsonChat = response.data;
      print(response);
      return right(
          jsonChat.map((user) => ChatModel.fromJson(user)).toList()
          );
    } catch (e) {
      return left(e.toString());
    }
  }

}
