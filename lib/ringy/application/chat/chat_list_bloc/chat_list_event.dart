part of 'chat_list_bloc.dart';

@immutable
abstract class ChatListEvent {}
class GetChatsEvent extends ChatListEvent{
 final String senderId;
 final String receiverId;
 final String limit;

  GetChatsEvent({required this.senderId, required this.receiverId, required this.limit});

}
class UpdateChatsEvent extends ChatListEvent{

  final List<ChatModel> chats;

  UpdateChatsEvent(this.chats);
}