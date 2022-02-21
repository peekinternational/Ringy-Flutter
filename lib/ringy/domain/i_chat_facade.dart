import 'package:dartz/dartz.dart';
import 'entities/chat_message/chat_message.dart';

abstract class IChatFacade{
  Future<Either<String,List<ChatModel>>> getChats();
}