import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/domain/i_chat_facade.dart';
import 'package:ringy_flutter/ringy/infrastructure/API/api_content.dart';
import 'package:ringy_flutter/ringy/infrastructure/API/dio_client.dart';

import '../../domain/entities/connect/get_user_ring.dart';

class ApiDataSource implements IChatFacade {
  Dio dio = DioClient.instance.getDioClient();

  @override
  Future<Either<String, List<ChatModel>>> getChats() async {
    try {
      String sId = "6152f067d8eda876c8d49cbe";
      String rId = "61aef7d8d5d2971bb4c8b890";
      String limit = "100";
      String pId = "5d4c07fb030f5d0600bf5c03";
      String url = APIContent.O2O_CHAT_FETCH +"/" + sId +"/" + rId +"/" +limit +"/" +pId
          +"/0";
      Response response;
      response = await dio.get(
        url
      );
      Iterable jsonChat = response.data;
      return right(jsonChat.map((user) => ChatModel.fromJson(user)).toList());
    } catch (e) {
      return left(e.toString());
    }
  }
  @override
  Future<Either<String, List<GetUserRingModel>>> getRingList(
 String projectId,
  String user_id) async {

    try {

      Response response;
      response = await dio.post(APIContent.GetUserRing,data:
      {APIContent.projectId: projectId,
      APIContent.userId:user_id}
      );
      Iterable jsonChat = response.data["ringData"];
      return right(jsonChat.map((user) => GetUserRingModel.fromJson(user)).toList());
    } catch (e) {
      return left(e.toString());
    }
  }


}
