
import 'package:dartz/dartz.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/user_model.dart';
import 'package:ringy_flutter/ringy/domain/entities/connect/get_user_ring.dart';
import 'package:ringy_flutter/ringy/domain/i_facade.dart';
import 'data_sources/api_data_source.dart';

class Repository implements IFacade {
  final ApiDataSource apiDataSource;

  Repository({required this.apiDataSource});

  @override
  Future<Either<String, List<ChatModel>>> getChats( String senderId, String receiverId ,String limit) {
  return apiDataSource.getChats(senderId,receiverId,limit);
  }
  @override
  Future<Either<String, ChatModel>> sendMessage(ChatModel model) {
    return apiDataSource.sendMessage(model);
  }
  @override
  Future<Either<String, List<GetUserRingModel>>> getRingList(String projectId, String user_id) {
    return apiDataSource.getRingList( projectId, user_id);
  }

  @override
  Future<Either<String, List<UsersModel>>> getUsersList(String projectId, String userId) {
    // TODO: implement getUsersList
    return apiDataSource.getUserList( projectId, userId);
  }

}
