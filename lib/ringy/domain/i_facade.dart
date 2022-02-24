import 'package:dartz/dartz.dart';
import 'package:ringy_flutter/ringy/domain/entities/connect/get_user_ring.dart';
import 'entities/chat_message/chat_message.dart';

abstract class IFacade{
  Future<Either<String,List<ChatModel>>> getChats();
  Future<Either<String,List<GetUserRingModel>>> getRingList(String projectId,String userId);
  Future<Either<String,ChatModel>> sendMessage(ChatModel model);
}