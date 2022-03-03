import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/user_model.dart';
import 'package:ringy_flutter/ringy/domain/i_facade.dart';
import 'package:ringy_flutter/ringy/domain/localDB/database.dart';
import 'package:ringy_flutter/ringy/domain/localDB/db_provider.dart';
import 'package:ringy_flutter/ringy/domain/localDB/users_dao.dart';
import 'package:ringy_flutter/ringy/infrastructure/API/api_content.dart';
import 'package:ringy_flutter/ringy/infrastructure/API/dio_client.dart';

import '../../domain/entities/connect/get_user_ring.dart';

class ApiDataSource implements IFacade {
  Dio dio = DioClient.instance.getDioClient();

  @override
  Future<Either<String, List<ChatModel>>> getChats(
      String senderId, String receiverId, String limit) async {
    try {
      /*  String sId = "6152f067d8eda876c8d49cbe";
      String rId = "61aef7d8d5d2971bb4c8b890";
      String limit = "100";*/
      String pId = "5d4c07fb030f5d0600bf5c03";
      String url = APIContent.O2O_CHAT_FETCH +
          "/" +
          senderId +
          "/" +
          receiverId +
          "/" +
          limit +
          "/" +
          pId +
          "/0";
      Response response;
      response = await dio.get(url);
      Iterable jsonChat = response.data;
      return right(jsonChat.map((user) => ChatModel.fromJson(user)).toList());
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, ChatModel>> sendMessage(ChatModel model) async {
    try {
      String uri = "";
      MessageData messageData = MessageData();
      messageData.projectId = "5d4c07fb030f5d0600bf5c03";
      messageData.msgData = model;
      //  uri = APIContent.GROUP_CHAT_SEND_URL;
      uri = APIContent.CHAT_SEND_URL;
      String json = jsonEncode(messageData.toJson());
      print(json);
      Response response;
      response = await dio.post(uri, data: json);
      //   ChatModel jsonChat =   response.data;

      print(response.data);
      return right(model);
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }


  @override
  Future<Either<String, List<GetUserRingModel>>> getRingList(
      String projectId, String user_id) async {
    try {
      Response response;
      response = await dio.post(APIContent.GetUserRing,
          data: {APIContent.projectId: projectId, APIContent.userId: user_id});
      Iterable jsonChat = response.data["ringData"];
      return right(
          jsonChat.map((user) => GetUserRingModel.fromJson(user)).toList());
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<UsersModel>>> getUsersList(
      String projectId, String uID) async {
    // @GET("/{url}/{uID}/{pId}/0/0/0")
    try {
      String url =
          APIContent.GetO2O_Users + "/" + uID + "/" + projectId + "/0/0/0";

      Response response = await dio.get(url);

      Iterable jsonChat = response.data;
      List<UsersModel> list = [];
      for (final element in jsonChat) {
        try {
          LatestMsg? latestMsg;
          latestMsg = element['latestMsg'] != null
              ? LatestMsg.fromJson(element['latestMsg'])
              : null;

          UsersModel model = UsersModel.fromJson(element);
          if (latestMsg != null) {
            model.latestMsg = latestMsg.message;
            model.latestMsgType = latestMsg.messageType;
            model.latestMsgCreatedAt = latestMsg.createdAt;
            model.latestMsgSenderId = latestMsg.senderId;
          }
          list.add(model);
          print(list);
        } catch (e) {
          print(e);
        }
      }
      // var db= await DBProvider.db.getDatabaseClient();
      // final userDao = db.userDao;
      // userDao.deleteAll();
      // userDao.insertAll(list);
      return right(list);
      // return right(jsonChat.map((user) => UsersModel.fromJson(user)).toList());
    } catch (e) {
      return left(e.toString());
    }
  }



  @override
  Future<Either<String, List<UsersModel>>> getUsersListFromDb() async {
    try {
      var db= await DBProvider.db.getDatabaseClient();
      final userDao = db.userDao;
      var list = await userDao.getUsers();
      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }
}
