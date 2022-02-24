part of 'send_chat_bloc.dart';

@immutable
abstract class SendChatEvent {}
class SendChatsEvent extends SendChatEvent{

  ChatModel model;

  SendChatsEvent(this.model);
}
