
import 'package:dartz/dartz.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/domain/entities/connect/get_user_ring.dart';
import 'package:ringy_flutter/ringy/domain/i_chat_facade.dart';
import 'data_sources/api_data_source.dart';

class ChatRepository implements IChatFacade {
  final ApiDataSource apiDataSource;

  ChatRepository({required this.apiDataSource});

  // @override
  // Future<Either<Unit, ChatModel>> getChat(int postId) {
  //  return  apiDataSource.getChat(postId);
  // }

  @override
  Future<Either<String, List<ChatModel>>> getChats() {
  return apiDataSource.getChats();
  }
  @override
  Future<Either<String, List<GetUserRingModel>>> getRingList(String projectId, String user_id) {
    return apiDataSource.getRingList( projectId, user_id);
  }

  // @override
  // Future<Either<Unit, List<CommentModel>>> getChatComments(int postId) {
  // return apiDataSource.getChatComments(postId);
  // }
}
