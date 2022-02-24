part of 'chat_list_bloc.dart';

@immutable
abstract class ChatListEvent {}
class GetChatsEvent extends ChatListEvent{}
class UpdateChatsEvent extends ChatListEvent{

  final List<ChatModel> chats;

  UpdateChatsEvent(this.chats);
}